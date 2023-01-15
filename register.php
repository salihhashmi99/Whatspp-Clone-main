<?php 
	if(isset($_POST['name'])){
		require_once 'functions.php'; 
		
		$phone_number = $_POST['phone_number'];
		$name = $_POST['name'];

		$users = get_user_by_phone($phone_number);

		$resp['code'] = 0;
		$resp['message'] = "";
		$resp['data'] = "";

		if(!empty($users)){
			$resp['code'] = 0;
			$resp['message'] = "There is a user with same phone number.";
			$resp['data'] = "";
			echo  json_encode($resp);
			die();
		} 

		$reg_date = time(); 
		$last_seen = time(); 
		$profile_photo = ""; 
		$sql = "INSERT INTO users (
					name,
					phone_number,
					reg_date,
					last_seen,
					profile_photo
				) VALUES (
					'{$name}',
					'{$phone_number}',
					{$reg_date},
					{$last_seen},
					'{$profile_photo}'
			)";

		if($conn->query($sql)){
			$resp['code'] = 1;
			$resp['message'] = "Account was created successfully.";
			$resp['data'] = "";

			$users = get_user_by_phone($phone_number);
			if(!empty($users)){
				$resp['data'] = json_encode($users[0]);
			}

			echo  json_encode($resp);
			die();
		}else{

			$resp['code'] = 0;
			$resp['message'] = "Failed  because ".$conn->error;
			$resp['data'] = "";
			echo  json_encode($resp);
			die(); 
		}
 
		die();
	}
 ?><form action="" method="post" accept-charset="utf-8">


	<input type="text" name="name" required="" placeholder="Name">
	<br>
	<br>
	<input type="text" name="phone_number" required="" placeholder="Phone number">
	<br>
	<br>
	<button type="submit">CREATE ACCOUNT</button>
	
</form>