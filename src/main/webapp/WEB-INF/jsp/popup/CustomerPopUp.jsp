<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : CustomerPopUp
	 * @Description : 거래처관리 검색팝업
	 */
%>
	<!--- 검색버튼 ---->
	<div id="divBtns">
			<div id="divWindowpath">
				<span id="title1"></span><span id="title2"></span><span id="title3"></span>
			</div>
			<div id="divBtn">
				
			<input type="button" id="cBtnSearch" class="commonBtn" value="Search" onclick="cSearch();">
			<input type="button" id="cBtnClose" class="commonBtn" value="Close" onclick="cClose();">
			</div>
	</div>
	<!---------->
<form id="frmSearch" action="#">
  <input type="hidden" name="CURRENT_PAGE" id="CURRENT_PAGE">
  <input type="hidden" name="ROWS_PER_PAGE" id="ROWS_PER_PAGE">
  <div id="ctm_sech_wrap">
    <ul class="sech_ul">
      <li class="sech_list">
        <div></div>
      </li>
    </ul>
    <!-------------- --->
    <h4>Search</h4>
    <table class="table_line" width="100%">
      <tbody>
        <tr>
          <td>Customer</td>
          <td><input type="text" name=" " id=" "></td>
          <td>＊Name</td>
          <td><input type="text" name=" 4" id=" 4"></td>
          <td>＊Search term 1,2</td>
          <td><input type="text" name=" 2" id=" 2">
          <input type="text" name=" 5" id=" 5"></td>
        </tr>
        <tr>
          <td>Sales Ogganization</td>
          <td><select id="select2" name="select2" class="">
            <option valu select="">==전체==</option>
            <option valu="">ddd</option>
            <option valu="">ddd</option>
            <option valu="">ddd</option>
          </select></td>
          <td>Distribution Channel</td>
          <td><select id="select" name="select" class="">
            <option valu select="">==전체==</option>
            <option valu="">ddd</option>
            <option valu="">ddd</option>
            <option valu="">ddd</option>
          </select></td>
          <td>Division</td>
          <td><select id="select3" name="select3" class="">
            <option valu select="">==전체==</option>
            <option valu="">ddd</option>
            <option valu="">ddd</option>
            <option valu="">ddd</option>
          </select></td>
        </tr>
        <tr>
          <td>Account Group</td>
          <td><select id="select5" name="select5" class="">
            <option valu select="">==전체==</option>
            <option valu="">ddd</option>
            <option valu="">ddd</option>
            <option valu="">ddd</option>
          </select></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </tbody>
    </table>
    <!-- ----------------- -->
  </div>
</form>
검색 값 목록이 들어갑니다.
