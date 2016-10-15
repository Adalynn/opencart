<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p><?php echo $powered; ?></p>
  </div>
</footer>



<style>

#adalynn_email_window_div {
  border: 1px solid orange; 
  position: fixed; 
  right: 0; 
  bottom: 10px; 
  width: 300px;
  height: 170px; 
  background: white;
  display:none;
}

.adalynn_100 {
  width: 100%;
  padding:5px;
}


.adalynn_ctrl {
  width: 100%;
  padding:2px;
}

.adalynn_ctrl_email_textbox {

}

.adalynn_ctrl_button {

}

.adalynn_lable {
  font-weight: bold;
  font-size: 12px;
  color:#000;  
}

.adalynn_msg {
  font-weight: bold;
  font-size: 12px;
  color:#000;  
}

.adalynn_error {
  color:#ff0000;  
}

.adalynn_success {
  color:#008000;  
}

</style>
<div id="adalynn_email_window_div">
  <div class="adalynn_100 adalynn_lable" id="adalynn_email_text_div">
    <lable>
      Please enter the email address below to subscribe for the latest updates.
    </lable>
  </div>
  <div class="adalynn_100 adalynn_msg" id="adalynn_email_message">

  </div>
  <div class="adalynn_100" id="adalynn_email_text_div">
    <input type="text" value="test@gmail.com" placeholder="Insert The Email Address" class="adalynn_ctrl adalynn_ctrl_email_textbox" id="adalynn_text_email" name="adalynn_text_email">
  </div>
  <div class="adalynn_100" id="adalynn_email_text_div">
    <button id="adalynn_email_submit_button" name="adalynn_email_submit_button" class="adalynn_ctrl adalynn_ctrl_button">Subscribe Me</button>
  </div>  
</div>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->


				
<!-- Start Open Web Analytics Tracker -->
<script type="text/javascript">
//<![CDATA[
// var owa_baseUrl = 'http://192.168.1.4/Open-Web-Analytics/';
// var owa_cmds = owa_cmds || [];
// owa_cmds.push(['setSiteId', 'b897eddbc734d197532f554815b2b844']);
// owa_cmds.push(['trackPageView']);
// owa_cmds.push(['trackClicks']);
// owa_cmds.push(['trackDomStream']);

// (function() {
// 	var _owa = document.createElement('script'); _owa.type = 'text/javascript'; _owa.async = true;
// 	owa_baseUrl = ('https:' == document.location.protocol ? window.owa_baseSecUrl || owa_baseUrl.replace(/http:/, 'https:') : owa_baseUrl );
// 	_owa.src = owa_baseUrl + 'modules/base/js/owa.tracker-combined-min.js';
// 	var _owa_s = document.getElementsByTagName('script')[0]; _owa_s.parentNode.insertBefore(_owa, _owa_s);
// }());
//]]>
</script>
<!-- End Open Web Analytics Code -->
				
		
<script>
$(document).ready(function() {
  $(window).scroll(function() {
    if ($(window).scrollTop() >= ($(document).height() - $(window).height())) {
      $('#adalynn_email_window_div').animate({width: 'toggle'});
    } else {
     $('#adalynn_email_window_div').fadeOut('slow');
    }
  });


  $("#adalynn_email_submit_button").on('click', function() {

    var sendData = new Object();
    sendData.emailid = $("#adalynn_text_email").val();
    console.dir(sendData);

    $.ajax({
      url: 'index.php?route=emails/newsletter/add',
      type: 'post',
      data: sendData,
      dataType: 'json',
      beforeSend: function() {
        // First before send will alert
      },
      complete: function() {
        // Third after success will alert
      },
      success: function(json) {
        // Second after berfore send will alert
        if (json.success) {
          $("#adalynn_email_message").removeClass("adalynn_error");
          $("#adalynn_email_message").addClass("adalynn_success");
          /**
           * Removing the subscriber form by fading it out 
           */
          setTimeout (function() {
            $("#adalynn_email_window_div").fadeOut("slow");
            $("#adalynn_text_email").val("");
            $("#adalynn_email_message").text("");
            $("#adalynn_email_message").removeClass("adalynn_success");
            $("#adalynn_email_message").removeClass("adalynn_error");  
          },2000);
        } else {
          $("#adalynn_email_message").removeClass("adalynn_success");
          $("#adalynn_email_message").addClass("adalynn_error");
        }
        $("#adalynn_email_message").text(json.message);
      },
      error: function(xhr, ajaxOptions, thrownError) {
        //alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

});    
</script>

</body>
</html>