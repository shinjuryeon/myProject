function idCheck() {
	var id = $('#com_id').val();
	if (id.length<4) {
  		$('#iMessage').html('아이디는 4글자 이상 입력해주세요');
  		return false;
  	} else if (id.replace(/[a-z.0-9]/gi, '').length > 0) {
  		$('#iMessage').html('아이디는 영문자와 숫자로만 구성되게 입력해주세요');
  		return false;
  	} else {
  		$('#iMessage').html('');
  		return true;
  	}
} //idCheck

function pwCheck() {
	var password = $('#com_password').val();
  	if (password.length<4) {
  		$('#pMessage').html('비밀번호는 4글자 이상 입력해주세요');
  		return false;
  	} else if (password.replace(/[!-*.@]/gi, '').length >= password.length) {
  		$('#pMessage').html('비밀번호는 특수문자가 반드시 1개 이상 포함되어야 합니다');
  		return false;
  	} else if (password.replace(/[0-9.!-*.@.a-z]/gi, '').length > 0) {
  		$('#pMessage').html('비밀번호는 영문자와 숫자와 특수문자로만 구성되게 입력해주세요');
  		return false;
  	} else {
  		$('#pMessage').html('');
  		return true;
  	}
} //pwCheck

function cnmCheck() {
	var name = $('#com_name').val();
  	if (name.length < 1) {
  		$('#nMessage').html('회사명은 1글자 이상 입력해주세요');
  		return false;
  	} else if (name.replace(/[a-z.가-힣.0-9]/gi, '').length > 0) {
  		$('#nMessage').html('회사명은 영문자와 숫자, 한글로만 구성되게 입력해주세요');
  		return false;
  	} else {
  		$('#nMessage').html('');
  		return true;
  	}	
} //cnmCheck

function cnCheck() {
	var name = $('#com_num').val();
	if (name.length < 10) {
		$('#cMessage').html('사업자등록번호는 10자리입니다');
		return false;	
	} else if (name.length > 11) {
		$('#cMessage').html('사업자등록번호는 10자리입니다');
		return false;
	} else if (name.replace(/[0-9]/gi, '').length > 0) {
		$('#cMessage').html('사업자등록번호는 숫자로만 구성되게 입력해주세요');
		return false;
	} else if (name == 0000000000) {
		$('#cMessage').html('사업자등록번호를 다시 확인해주세요');
	} else {
		$('#cMessage').html('');
		return true;
	}
} //cmCheck
