// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import FlashController from "./flash_controller"
import ToggleControler from "./toggle_controller"
import AOSController from "./aos_controller"
import BannersController from "./banners_controller"
import CartController from "./cart_controller"
import OrderController from "./order_controller"
import MaskController from "./mask_controller"
import SlimSelectController from "./slim_select_controller"

application.register("flash", FlashController)
application.register("toggle", ToggleControler)
application.register("aos", AOSController)
application.register("banners", BannersController)
application.register("cart", CartController)
application.register("order", OrderController)
application.register("mask", MaskController)
application.register("slim-select", SlimSelectController)