<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="header">
	<h1>UNTITLED</h1>


	<div class="log_info" >
		<a href="#" id="logbtn"  >다시 뵙게되어 반갑습니다. <strong>Super Admin</strong> 님</a>
	</div>
	<script type="text/javascript">
	$('#logbtn').click(function() {
	  $('#go_loginfo_1').toggle('slow', function() {
		// Animation complete.
	  });
	});

		function logout(){
			$(location).attr('href',"/");
		}
	</script>
	<div id="go_loginfo_1"  style="display:none;">
	<div class="arrow"></div>
		<ul>
			<li><a href="javascript:logout()"><img src="/src/admin/images/common/icon_logout.png" />로그아웃</a></li>
		</ul>
	</div>

	<script type="text/javascript">
	$suggest_checking = $("#go_loginfo_1");
	$suggest_checking.hover(
	function(){
			$(this).css("display","block");
		},
			function(){
			$(this).css("display","none");
		}
	);
	</script>

</div><!-- END header//-->