// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


!function(t){"use strict";t("#load").hide(),t("#success").hide(),t("#whatsapp-error").hide(),t("#email-error").hide(),t("#maintence-error").hide(),t(".contact1").css("visibility","visible");var e,a,n=document.querySelector("#phone"),i=window.intlTelInput(n,{initialCountry:"auto",geoIpLookup:function(e){t.get("https://ipinfo.io",function(){},"jsonp").always(function(t){var a=t&&t.country?t.country:"";this.mCountryCode=a,e(a)})}});e=document.getElementById("phone"),a=function(t){return/^\d*\.?\d*$/.test(t)},["input","keydown","keyup","mousedown","mouseup","select","contextmenu","drop"].forEach(function(t){e.addEventListener(t,function(){a(this.value)?(this.oldValue=this.value,this.oldSelectionStart=this.selectionStart,this.oldSelectionEnd=this.selectionEnd):this.hasOwnProperty("oldValue")&&(this.value=this.oldValue,this.setSelectionRange(this.oldSelectionStart,this.oldSelectionEnd))})});t('.validate-input input[name="name"]');var o=t('.validate-input input[name="email"]'),r=t('.validate-input input[name="whatsapp"]'),s=t("#pacote");function l(){var e,a=!0;return null==t(o).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/)&&(u(o),a=!1),null==t(r).val().trim().match(/^[0-9]*$/)&&(e=t(r).parent(),t(e).addClass("alert-validate"),a=!1),-1==t(s).val()&&(u(s),a=!1),a}function u(e){var a=t(e).parent();t(a).addClass("alert-validate")}t(".validate-form4").on("submit",function(){return l()}),t(".validate-form .input1").each(function(){t(this).focus(function(){var e;e=t(this).parent(),t(e).removeClass("alert-validate")})});t("#generateTest").on("click",function(){if(l()){var e=i.getSelectedCountryData().dialCode;null==e&&(e="55");var a={email:t(o).val(),whatsapp:e+t(r).val(),pack:t(s).val(),tenant:"6win"};t("#form").hide(),t("#load").show(),t.ajax({url:"http://6win.tv:8080/api/line-tests",type:"POST",dataType:"json",contentType:"application/json",data:JSON.stringify(a),success:function(e){t("#load").hide(),t("#success").show(),window.location.href="https://api.whatsapp.com/send?phone=351930438390&text=Ol%C3%A1,%20vim%20pelo%20site%206Win%20IPTV.%20Estou%20aguardando%20meu%20teste"},error:function(e){var a=e.responseJSON.errorKey;"whatsapp.alreadysaved"==a?t("#whatsapp-error").show():"email.already"==a?t("#email-error").show():t("#maintence-error").show(),t("#load").hide()}})}})}(jQuery);