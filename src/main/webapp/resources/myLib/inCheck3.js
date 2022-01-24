function codeCheck() {
	var id = $('#category_code').val();
	if (id > 99999 || id < 1) {
  		$('#iMessage').html('상품코드번호는 1 이상 99999 이하로 입력해주세요');
  		return false;
  	} else if (id.replace(/[0-9]/g, '').length > 0) {
  		$('#iMessage').html('상품코드번호는 정수로만 구성되게 입력해주세요');
  		return false;
  	} else {
  		$('#iMessage').html('');
  		return true;
  	}
} //codeCheck

function korCheck() {
	var name = $('#category_korcode').val();
	if (name.length < 1) {
		$('#pMessage').html('상품등록명은 1글자 이상 입력해주세요');
		return false;
	} else {
		$('#pMessage').html('');
		return true;
	}
	
} //korCheck
