/**
 * member input Data 무결성 확인 function
** member 무결성 확인사항
// ID : 길이(4이상), 영문자,숫자 로만 구성
// password : 길이(4이상), 영문,숫자,특수문자로 구성, 특수문자는 반드시 1개 이상 포함할것
// Name : 길이(2이상), 영문 또는 한글로 만 입력
// Level : select 를 이용 (X)
// BirthDay : 입력 여부 확인  ( length == 10 )
// Point : 정수의 범위  ( 숫자이면서, '.'이 없어야함 )
// Weight: 구간 (20 ~ 200)

** 작성 규칙
	=> JavaScript function 으로 정의하고
	   결과를 true or false로 return
*/
function idCheck() {
	var id = $('#user_id').val();
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
	var password = $('#user_password').val();
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

function nmCheck() {
	var name = $('#user_name').val();
  	if (name.length < 2) {
  		$('#nMessage').html('이름은 2글자 이상 입력해주세요');
  		return false;
  	} else if (name.replace(/[a-z.가-힣]/gi, '').length > 0) {
  		$('#nMessage').html('이름은 영문자와 한글로만 구성되게 입력해주세요');
  		return false;
  	} else {
  		$('#nMessage').html('');
  		return true;
  	}	
} //nmCheck
