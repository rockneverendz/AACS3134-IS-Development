<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="St._Freya_Emblem.png" rel="icon" />

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
	<script src="../../bootstrap/js/bootstrap.min.js"></script>
	<!-- Font Awsome -->
	<script defer src="https://use.fontawesome.com/releases/v5.7.2/js/all.js" integrity="sha384-0pzryjIRos8mFBWMzSSZApWtPl/5++eIfzYmTgBBmXYdhvxPc+XcFEk+zJwDgWbP" crossorigin="anonymous"></script>

	<title>Password Recovery</title>

	<style>
		.form-recovery{
			width: 100%;
            max-width: 550px;
            padding: 15px;
            margin: auto;
			margin-top: 50px;
		}



	</style>
</head>

<body>

	<!-- Navigation Bar	-->
	<nav class="navbar sticky-top navbar-light bg-light">
		<a class="navbar-brand" href="#">
			<img src="St._Freya_Emblem.png" width="30" class="d-inline-block align-top" alt="">
			Password Recovery
		</a>
	</nav>


	<!-- Main	-->
	<form class="form-recovery">
		<h1 style="margin-bottom: 30px;"> Retrieve Password </h1>
		<div class="form-row">
			<div class="form-group">
				<label for="inputUsername">Enter Token to Change Password*</label>
				<input type="username" class="form-control" id="inputUsername" placeholder="Token" required>
			</div>
		</div>

		<button class="btn btn-secondary">Back</button>
		<button class="btn btn-outline-primary">Resend Token</button>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>



</body>

</html>