<?php
if (
	isset($_POST['sender']) &&
	isset($_POST['receiver']) &&
	isset($_POST['body'])
) {
	require_once 'functions.php';
	$sender = trim($_POST['sender']);
	$receiver = trim($_POST['receiver']);
	$body = trim($_POST['body']);
	$resp = send_message($sender, $receiver, $body);

	if ($resp['data'] != null) {
		$data = $resp['data'];
		unset($resp['data']);
		$resp['data'] = json_encode($data);
	}

	echo json_encode($resp);
	die();
}
?><form action="" method="post" accept-charset="utf-8">
	<input type="" name="sender" value="1">
	<br>
	<br>
	<input type="" name="receiver" value="2">
	<br>
	<br>
	<input type="" name="body" value="Good morning!">
	<br>
	<br>
	<input type="submit" value="SEND MESSAGE" name="">
</form>