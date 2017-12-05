<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Cash</title>
	<script type="text/javascript">
		function check()
		{
			if(c.check.value == "")
			{
				alert("충전금액을 선택해주세요!");
				return false;
			}
			if(c.submit()){
				alert("충전 신청 완료!")
			}
		}
	</script>
<div class="cash_list_area">
	<div class="cash_package">
 	 <p>캐시 충전</p>
	  <dl>
	   <dt>결제수단</dt>
	   <dd>현금</dd>	
	  </dl>
	</div>
	<div class="cash_meau" style="width: 826px;height: 298px;">
		<ul>
			<li>
				<dl>
					<dt>
						<span class="bliend">포인트 11000원</span>
					</dt>
						<dd>
							<span><strong>10000</strong>원</span>
						</dd>
				</dl>
			</li>
		</ul>
		<ul>
		</ul>
	</div>
</div>