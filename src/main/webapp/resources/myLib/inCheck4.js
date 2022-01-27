function nameCheck() {
	var id = $('#item_name').val();
	if (id.length<1) {
  		$('#nMessage').html('상품명은 1글자 이상 입력해주세요');
  		return false;
  	} else {
  		$('#nMessage').html('');
  		return true;
  	}
} //nameCheck

function priceCheck() {
	var id = $('#item_price').val();
  	if (id.length<1 || id>2147483647) {
  		$('#pMessage').html('상품가격을 확인하세요');
  		return false;
  	} else if (id.replace(/[0-9]/gi, '').length > 0) {
  		$('#pMessage').html('상품가격은 숫자로만 구성되게 입력해주세요');
  		return false;
  	} else {
  		$('#pMessage').html('');
  		return true;
  	}
} //priceCheck

function invenCheck() {
	var inventory = $('#inventory').val();
  	if (inventory.length<1 || inventory>2147483647) {
  		$('#iMessage').html('상품재고를 확인하세요');
  		return false;
  	} else if (inventory.replace(/[0-9]/gi, '').length > 0) {
  		$('#iMessage').html('상품재고는 숫자로만 구성되게 입력해주세요');
  		return false;
  	} else {
  		$('#iMessage').html('');
  		return true;
  	}
} //inCheck

