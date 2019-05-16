$(document).ready(function() {
  var notificationList = `<ul class="pc-header__user-box" id="notification-list">
  <li class="pc-header__notification-list__link icon-arrow-r">
    <figure>
      <img src="/assets/mercari_profile.png" alt="icon">
    </figure>
    <div class="notification-box">
      <p class="notification-box__message">お知らせ１</p>
      <p class="notification-box__date-passed icon-clock">1日前</p>
    </div>
  </li>

  <li class="pc-header__notification-list__link icon-arrow-r">
    <figure>
      <img src="/assets/mercari_profile.png" alt="icon">
    </figure>
    <div class="notification-box">
      <p class="notification-box__message">お知らせ１</p>
      <p class="notification-box__date-passed icon-clock">1日前</p>
    </div>
  </li>

  <li class="pc-header__notification-list__link icon-arrow-r">
    <figure>
      <img src="/assets/mercari_profile.png" alt="icon">
    </figure>
    <div class="notification-box">
      <p class="notification-box__message">お知らせ１</p>
      <p class="notification-box__date-passed icon-clock">1日前</p>
    </div>
  </li>

  <li class="pc-header__notification-list__link icon-arrow-r">
    <figure>
      <img src="/assets/mercari_profile.png" alt="icon">
    </figure>
    <div class="notification-box">
      <p class="notification-box__message">お知らせ１</p>
      <p class="notification-box__date-passed icon-clock">1日前</p>
    </div>
  </li>
</ul>`

  $('#notification-list__root').on("mouseover", function(){
    $(this).append(notificationList);
    $('pc-header__user-box').css("opacity",1)
    $(this).off('mouseover');

      $('#notification-list').on("mouseout", function(){
        $(this).empty();
      }); //mouseout時のアクション end
    }); //mouseover時のアクション end
});
