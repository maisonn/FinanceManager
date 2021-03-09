// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "bootstrap"
import "../stylesheets/application"
import "../plugins/flatpickr"
import "../plugins/highcharts"

require("chartkick")
require("highcharts")
require("flatpickr")
require("flatpickr/dist/themes/material_green.css")


Rails.start()
Turbolinks.start()
ActiveStorage.start()


document.addEventListener('turbolinks:load', function () {
    $("#checkgroupby").click(function () {
        if ($(this).is(":checked")) {
            $("#groupby").show();
        } else {
            $("#groupby").hide();
        }
    });
});

