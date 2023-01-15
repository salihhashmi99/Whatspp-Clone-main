<?php

$conn = new mysqli("localhost", "root", "", "whatsapp");

function send_message($sender, $receiver, $body) {
	global $conn;
	$chat_thread = get_chat_thread($sender, $receiver);
	$body = mysqli_real_escape_string($conn, $body);
	$message_type = "text";
	$receive_time = "sent";
	$sent_time = time();
	$last_update = time();
	$seen = 0;
	$sql = "
			INSERT INTO message (
				body,
				chat_thread,
				message_type,
				receiver,
				sender,
				receive_time,
				sent_time,
				last_update,
				seen
			) VALUES (
				'{$body}',
				'{$chat_thread}',
				'{$message_type}',
				'{$receiver}',
				'{$sender}',
				'{$receive_time}',
				'{$sent_time}',
				{$last_update},
				{$seen}
			)
	";

	$response['code'] = 0;
	$response['message'] = 0;
	$response['data'] = null;
	if (!$conn->query($sql)) {
		$response['code'] = 0;
		$response['message'] = $conn->error;
		$response['data'] = null;
		return $response;
	}

	$response['code'] = 1;
	$response['message'] = "Message sent successfully.";
	$response['data'] = get_last_message($chat_thread);
	return $response;
}

function get_last_message($chat_thread) {
	global $conn;
	$sql = "SELECT * FROM message,users WHERE chat_thread = '{$chat_thread}' AND user_id = message.receiver  ORDER BY message_id DESC LIMIT 1";

	$res = $conn->query($sql);

	if ($res->num_rows > 0) {
		$msg = $res->fetch_assoc();
	} else {
		$msg = null;
	}
	return $msg;
}

function get_chats($user_id = 0, $min_time = 0) {
	$sql = "SELECT * FROM  message,users
				WHERE
				(sender = {$user_id} OR receiver = $user_id)
				AND
				last_update > {$min_time}
				AND
				message.receiver = users.user_id
			";

	global $conn;
	$res = $conn->query($sql);
	$chats = array();
	while ($chat = $res->fetch_assoc()) {
		$sender = $chat['sender'];
		if ($sender != $user_id) {
			$message_id = $chat['message_id'];
			$receive_time = "downloaded";
			$last_update = time();

			$chat['receive_time'] = $receive_time;
			$chat['last_update'] = $last_update;

			$sql = "UPDATE message
						receive_time = '{$receive_time}',
						last_update = '{$last_update}'
					WHERE
						message_id = {$message_id}

			";
		}
		$chats[] = $chat;
	}
	if ($chats == null) {
		return array();
	}
	return $chats;
}

function get_chat_thread($sender, $receiver) {
	$sql = "SELECT chat_thread FROM  message
				WHERE
				(sender = {$sender} AND receiver = $receiver) OR
				(receiver = {$sender} AND sender = $receiver)
				";

	global $conn;
	$res = $conn->query($sql);
	$chat_thread = $res->fetch_assoc();
	if ($chat_thread != NULL) {
		return $chat_thread['chat_thread'];
	}

	$new_thread = $sender . "_" . $receiver;
	return $new_thread;
}

function get_user_by_phone($phone) {
	$sql = "SELECT * FROM users WHERE phone_number = '{$phone}'";
	global $conn;

	$res = $conn->query($sql);

	$users = array();
	while ($user = $res->fetch_assoc()) {
		array_push($users, $user);
	}
	return $users;
}

function get_users() {
	$sql = "SELECT * FROM users ORDER BY name ASC";
	global $conn;

	$res = $conn->query($sql);

	$users = array();
	while ($user = $res->fetch_assoc()) {
		array_push($users, $user);
	}
	return $users;
}