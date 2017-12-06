
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Cash</title>
	<div id="container" class="my_area">
		<div class="page-wrapper" style="width: 700px">
			<script type="text/javascript">
		function check()
		{
			if(c.optionsRadios.value == "")
			{
				alert("금액을 설정해주세여!")
				return false;
			}
			if(c.submit()){
				alert("충전 신청 완료!!")
			}
		}
	</script>
	<br/>
	<div class="row" style="margin: 20px 0 20px 0">
			<div class="col-xs-6" align='left' style="padding-left: 0px; width: 95px; margin-top: 70px;margin-left: 50px;">
                  <p>결제 패키지</p>
                  <dl>
                      <dt>결제수단</dt>
                      <dd>너님 클릭</dd>
                  </dl>
    		</div>
	<form name="c" method="post" action="cash.do">
		<div class="col-xs-6" align='center' style="padding-right: 0px; margin-left: 80px;margin-top: 50px;">
		<label style="margin-right: 10px;margin-left: 35px;margin-bottom: 20px;">캐시 충전</label>
		<div id="container" class="my_area_v2">
		<div class="page-wrapper" style="width: 700px">
		<div class="col-xs-6" align='left' style="padding-left: 0px; width: 150px;">
		
			<div class="radio">
				<label>
					<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1"><!-- checked=""라는게 끝에 있었음. -->
					포인트 11000원
				</label>
			</div>
			&nbsp;
			<div class="radio">
				<label>
					<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
					포인트 22000원
				</label>
			</div>
			&nbsp;
			<div class="radio">
				<label>
					<input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">
					포인트 33000원
				</label>
			</div>
			&nbsp;
			<div class="radio">
				<label>
					<input type="radio" name="optionsRadios" id="optionsRadios4" value="option5">
					포인트 44000원
				</label>
			</div>
			&nbsp;
			<div class="radio">
				<label>
					<input type="radio" name="optionsRadios" id="optionsRadios5" value="option5">
					포인트 55000원
				</label>
			</div>
			</div>
			<!-- 여기를 반으로 나눠야 한다고.. -->
				<div class="col-xs-6" align='right' style="padding-right: 0px; width: 150px; margin-left: 50px;">
			<div class="radio">
				<label>
					<input type="radio" name="optionsRadios" id="optionsRadios6" value="option6">
					포인트 66000원
				</label>
			</div>
			&nbsp;
			<div class="radio">
				<label>
					<input type="radio" name="optionsRadios" id="optionsRadios7" value="option7">
					포인트 77000원
				</label>
			</div>
			&nbsp;
			<div class="radio">
				<label>
					<input type="radio" name="optionsRadios" id="optionsRadios8" value="option8">
					포인트 88000원
				</label>
			</div>
			&nbsp;
			<div class="radio">
				<label>
					<input type="radio" name="optionsRadios" id="optionsRadios9" value="option9">
					포인트 99000원
				</label>
			</div>
			&nbsp;
			<div class="radio">
				<label>
					<input type="radio" name="optionsRadios" id="optionsRadios10" value="option10">
					포인트 110000원
				</label>
				</div>
					</div>
				</div>
			</div>
	</div>
<div class="row">
<table align="center" style="margin-top: 300px;margin-left: 390px;">
	<tr>
	 <td colspan="2"><div align="center"><br/>
	 	<input class="btn default" name="" type="button" value="충전요청" onclick="check()" style="margin-right: 140px;">
	 	<input class="btn default" name="" type="button" value="뒤로가기" onclick="history.go(-1)">
	 </div></td>
	</tr>
</table>
</div>
</form>

		</div>
    </div>
</div>





