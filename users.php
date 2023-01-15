<?php 
require_once 'functions.php';
if(isset($_GET['phone_number'])){
	$phone_number = $_GET['phone_number'];
	$u = get_user_by_phone($phone_number);
	print_r(json_encode($u));
	die();
}

echo json_encode(get_users());
die();
