<!DOCTYPE html>
<html>
    <head>
        <title>CMS</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
        <script src="./bootstrap/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <main role="main">
            <div class="jumbotron">
                <div class="container">
                    <h1 class="display-3">AACS3134</h1>
                    <h1 class="display-4">Information Systems Development</h1>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h2>Customer</h2>
                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                        <p><a class="btn btn-secondary" href="./user/account/signin.jsp" role="button">View details »</a></p>
                    </div>
                    <div class="col-md-6">
                        <h2>Staff</h2>
                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                        <p><a class="btn btn-secondary" href="./staff/account/signin.jsp" role="button">View details »</a></p>
                    </div>
                </div>
                <hr>

                <form action="./SendMail">
                    This is of course not going to be here, I was just testing here.
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">From</label>
                        <div class="col">
                            <input type="text" readonly class="form-control-plaintext" value=<%= System.getProperty("mail")%>>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Email</label>
                        <div class="col">
                            <input type="email" name="email" class="form-control" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Subject</label>
                        <div class="col">
                            <input type="text" name="subject" class="form-control" placeholder="Subject">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Content</label>
                        <div class="col">
                            <textarea class="form-control" name="subject" placeholder="Content"></textarea>
                        </div>
                    </div>
                    <div class="form-group row offset-2">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </main>
    </body>
</html>