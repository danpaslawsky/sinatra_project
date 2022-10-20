require_relative './config/environment'


use Rack::MethodOverride

use CategoryController
use UsersController
use BooksController
run ApplicationController
