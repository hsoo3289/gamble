
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
	<div class="col-lg-3" style="margin-top: 70px;">
                    <div class="panel panel-warning" style="height: 162px;">
                        <div style='text-align:center' class="panel-heading">
                        	결제패키지
                        </div>
                        <div style='text-align:center' class="panel-body">
                            <p>결제수단</p>
                        </div>
                        <div style='text-align:center'class="panel-body">
                            	너님 클릭!
                        </div>
                    </div>
                    <!-- /.col-lg-3 -->
                </div>
               <div class="panel panel-yellow" style="height: 352px;">
                        <div style='text-align:center' class="panel-heading" style="margin-left: 200px;">
                            		캐시 충전
                        </div>
               <div class="panel-container" id="page-wrapper" style="margin-left: 200px;">
                 <div class="row">
                   <div class="col-xs-6" align='left' style="padding-right: 0px;">
			            <div class="radio">
							<label>
								<input type="radio" name="money" id="optionsRadios1" value="11000"><!-- checked=""라는게 끝에 있었음. -->
								포인트 11000원
							</label>
						</div>
						&nbsp;
						<div class="radio">
							<label>
								<input type="radio" name="money" id="optionsRadios2" value="22000">
								포인트 22000원
							</label>
						</div>
						&nbsp;
						<div class="radio">
							<label>
								<input type="radio" name="money" id="optionsRadios3" value="33000">
								포인트 33000원
							</label>
						</div>
						&nbsp;
						<div class="radio">
							<label>
								<input type="radio" name="money" id="optionsRadios4" value="44000">
								포인트 44000원
							</label>
						</div>
						&nbsp;
						<div class="radio">
							<label>
								<input type="radio" name="money" id="optionsRadios5" value="55000">
								포인트 55000원
							</label>
								</div>
							</div>
						<!-- 여기를 반으로 나눠야 한다고.. -->
							<div class="col-xs-6" align='center' style="padding-right: 0px;">
						<div class="radio">
							<label>
								<input type="radio" name="money" id="optionsRadios6" value="66000">
								포인트 66000원
							</label>
						</div>
						&nbsp;
						<div class="radio">
							<label>
								<input type="radio" name="money" id="optionsRadios7" value="77000">
								포인트 77000원
							</label>
						</div>
						&nbsp;
						<div class="radio">
							<label>
								<input type="radio" name="money" id="optionsRadios8" value="88000">
								포인트 88000원
							</label>
						</div>
						&nbsp;
						<div class="radio">
							<label>
								<input type="radio" name="money" id="optionsRadios9" value="99000">
								포인트 99000원
							</label>
						</div>
						&nbsp;
						<div class="radio">
							<label>
								<input type="radio" name="money" id="optionsRadios10" value="110000">
								포인트 110000원
							</label>
							</div>
					</div>
                        </div>
                 </div>
                        <div class="panel-footer">
                            <input class="btn default" name="" type="button" value="충전요청" onclick="check()" style="margin-right: 140px;">
	 						<input class="btn default" name="" type="button" value="뒤로가기" onclick="history.go(-1)">
                        </div>
                    </div>
	<form name="c" method="post" action="cash.do">
</form>

		</div>
    </div>
</div>





