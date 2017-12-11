<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- 
<script
	src="${pageContext.request.contextPath}/bootstrap/bower_components/jquery/dist/jquery.min.js"></script>
	 -->

<script>
	function aa(){
		console.log("aa");
		location.href="index.html";
		//$("#area").load("../driving/index.html");
	}
	
	function bb(){
		console.log("aa");
		window.open("../driving/index.html");
		//$("#area").load("../driving/index.html");
	}
	function cc(){
		console.log("aa");
		window.open("index.html");
		//$("#area").load("../driving/index.html");
	}
	
</script>
aaa

<div class="row" id="area" style="text-align:center;">??????</div>
aa
<button onclick="aa()">aa</button>
<button onclick="bb()">bb</button>
<button onclick="cc()">cc</button>