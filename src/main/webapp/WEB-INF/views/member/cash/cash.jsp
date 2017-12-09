
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Cash</title>



<script type="text/javascript">
	function check() {
		console.log("check");
		var charing = $(':input[name=charing]:radio:checked').val();
		if (charing) {
			alert(charing + "을 선택했습니다");
			ajax_submit($('#radioform').serialize());
			location.href = "list.list.cash_list?member_seq=${user.no}";
			return true;
		} else {
			alert("금액을 선택하세요!");
			return false;
		}
	}
	function ajax_submit(val) {
		console.log("ajax 실행:" + val);
		$.ajax({
			type : "post",
			url : "insert.do.cash",
			data : val,
			success : function() {
				console.log("성공");
			}
		});
	}
</script>
<br />

<div align="center" class="col-lg-4" style="width: 202px;">
	<div class="panel panel-warning">
		<div class="panel-heading">
			<b>결제 패키지</b>
		</div>
		<div class="panel-body">
			<p>결제 수단</p>
		</div>
		<div class="panel-heading">당신의 클릭 : )</div>
	</div>
</div>


<div class="col-lg-4">
	<div class="panel panel-yellow">
		<div align="center" class="panel-heading"><b>캐시 충전</b></div>
		<div class="panel-body">
			<form id="radioform" name="c" method="post" action="insert.do.index">
				<div style="float: left">
					<div class="radio">
						<label> <input type="radio" name="charing"
							id="optionsRadios1" value="11000">포인트 <b>11000</b>원
						</label>
					</div>
					&nbsp;
					<div class="radio">
						<label> <input type="radio" name="charing"
							id="optionsRadios2" value="22000"> 포인트 <b>22000</b>원
						</label>
					</div>
					&nbsp;
					<div class="radio">
						<label> <input type="radio" name="charing"
							id="optionsRadios3" value="33000"> 포인트 <b>33000</b>원
						</label>
					</div>
					&nbsp;
					<div class="radio">
						<label> <input type="radio" name="charing"
							id="optionsRadios4" value="44000"> 포인트 <b>44000</b>원
						</label>
					</div>
					&nbsp;
					<div class="radio">
						<label> <input type="radio" name="charing"
							id="optionsRadios5" value="55000"> 포인트 <b>55000</b>원
						</label>
					</div>
				</div>
				<!--  여기서 양옆으로 나누기   -->
				<div style="float: right">
					<div class="radio">
						<label> <input type="radio" name="charing"
							id="optionsRadios6" value="66000"> 포인트 <b>66000</b>원
						</label>
					</div>
					&nbsp;
					<div class="radio">
						<label> <input type="radio" name="charing"
							id="optionsRadios7" value="77000"> 포인트 <b>77000</b>원
						</label>
					</div>
					&nbsp;
					<div class="radio">
						<label> <input type="radio" name="charing"
							id="optionsRadios8" value="88000"> 포인트 <b>88000</b>원
						</label>
					</div>
					&nbsp;
					<div class="radio">
						<label> <input type="radio" name="charing"
							id="optionsRadios9" value="99000"> 포인트<b>99000</b>원
						</label>
					</div>
					&nbsp;
					<div class="radio">
						<label> <input type="radio" name="charing"
							id="optionsRadios10" value="110000"> 포인트 <b>110000</b>원
						</label>
					</div>
				</div>
			</form>
		</div>
		<div align="center" class="panel-footer">
			<input type="hidden" name="member_seq" value="${user.no}"> <input
				type="hidden" name="money" value="${user.money}"> <input
				class="btn btn-outline btn-danger" name="" type="button"
				value="충전요청" onclick="check()" style="margin-right: 140px;">
			<input class="btn btn-outline btn-info" name="" type="button"
				value="뒤로가기" onclick="history.go(-1)">
		</div>
	</div>
</div>


















