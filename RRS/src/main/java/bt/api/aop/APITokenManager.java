package bt.api.aop;

import java.security.Key;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.client.HttpServerErrorException;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.SignatureException;
import io.jsonwebtoken.UnsupportedJwtException;
import io.jsonwebtoken.impl.crypto.MacProvider;

public class APITokenManager {
	
	private static final Logger logger = LoggerFactory.getLogger(APITokenManager.class);
	
	private static final Key jwtKey = MacProvider.generateKey();
	
	/**
	 * 
	 * @param token
	 * @return
	 * @throws HttpServerErrorException
	 */
	public static String authenticate(String token) throws HttpServerErrorException {
		Jws<Claims> jwts = null;
		try {
			jwts = Jwts.parser()
				.setSigningKey(jwtKey)
				.parseClaimsJws(token);
		} catch (ExpiredJwtException | UnsupportedJwtException | MalformedJwtException | SignatureException | IllegalArgumentException e) {
			logger.debug(e.getLocalizedMessage());
			throw new HttpServerErrorException(HttpStatus.UNAUTHORIZED, e.getLocalizedMessage());
		}
		
		String custCd = jwts.getBody().getId();
		
		return custCd;
	}
	
	/**
	 * 
	 * @param minute
	 * @return
	 */
	public static String createOmsToken(int minute, String custId) {
		Date date =  new Date();
		Calendar calendar = Calendar.getInstance(); 
		calendar.setTime(date); 
		calendar.add(Calendar.MINUTE, minute);
		Date expireDate = calendar.getTime();
		
		String token = Jwts.builder()
					.setExpiration(expireDate)
					.setId(custId)
					.signWith(SignatureAlgorithm.HS512, jwtKey)
					.compact();
		
		logger.debug("make OMS token: " + token);
		return token;
	}
}