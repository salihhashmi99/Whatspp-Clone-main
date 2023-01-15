<?php
require_once 'functions.php';
$min_time = 0;

if (!isset($_GET['user_id'])) {
	die("[]");
}

if (isset($_GET['min_time'])) {
	$min_time = $_GET['min_time'];
}

$user_id = $_GET['user_id'];
if (strlen($user_id) < 1) {
	die("[]");
}

$chats = get_chats($user_id, $min_time);

echo json_encode($chats);
die();
