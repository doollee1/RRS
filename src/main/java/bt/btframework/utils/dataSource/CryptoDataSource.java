package bt.btframework.utils.dataSource;

import java.io.UnsupportedEncodingException;

import org.apache.commons.dbcp.BasicDataSource;


public class CryptoDataSource extends BasicDataSource {
    @Override
    public synchronized void setUrl(String url) {
        try {
            //log.debug(new String(SEED_KISA.DECRYPT(url), "UTF-8").trim());
            super.setUrl(new String(SEED_KISA.DECRYPT(url), "UTF-8").trim());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void setUsername(String username) {
        try {
            //log.debug(new String(SEED_KISA.DECRYPT(username), "UTF-8").trim());
            super.setUsername(new String(SEED_KISA.DECRYPT(username), "UTF-8").trim());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void setPassword(String password) {
        try {
            //log.debug(new String(SEED_KISA.DECRYPT(password), "UTF-8").trim());
            super.setPassword(new String(SEED_KISA.DECRYPT(password), "UTF-8").trim());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}
