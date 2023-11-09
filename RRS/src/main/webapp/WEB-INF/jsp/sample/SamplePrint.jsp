<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>
<style type="text/css">
	html,body {width:100%;height:100%;margin:0;padding:0;overflow:hidden;background-color:#fff;}
    table { page-break-inside:auto; border-collapse:collapse;border-spacing:0;}
    div   { page-break-inside:avoid; } /* This is the key */
    thead { display:table-header-group }
    tfoot { display:table-footer-group }
    th {padding:5px 10px 0 0; border-right:1px solid #c1d0dc; height:19px; vertical-align:top; text-align:right; background:#DFEBF7; font-weight:normal;}
    tr {border-bottom:1px solid #C1D0DC;}
    td {padding:2px; background:#fff;}
</style>
</head>
<script type="text/javascript">
function pagePrintPreview(){
	var browser = navigator.userAgent.toLowerCase();
	if ( -1 != browser.indexOf('chrome') ){
		window.print();
	}else if ( -1 != browser.indexOf('trident') ){
		try{
			//참고로 IE 5.5 이상에서만 동작함
			//웹 브라우저 컨트롤 생성
			var webBrowser = '<OBJECT ID="previewWeb" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
			//웹 페이지에 객체 삽입
			document.body.insertAdjacentHTML('beforeEnd', webBrowser);
			//ExexWB 메쏘드 실행 (7 : 미리보기 , 8 : 페이지 설정 , 6 : 인쇄하기(대화상자))
			previewWeb.ExecWB(7, 1);
			//객체 해제
			previewWeb.outerHTML = "";
			}catch (e) {
				alert("err");
			}         
      }         
}
</script>
<body onload="pagePrintPreview();">
    <table>
        <thead>
            <tr><th>heading</th></tr>
        </thead>
        <tfoot>
            <tr><td>notes</td></tr>
        </tfoot>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td><div>Long<br />cell<br />should'nt<br />be<br />cut</div></td>
        </tr>
        <tr>
            <td>x</td>
        </tr>
    </tbody>
    </table>
</body>
</html>