<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <%--<meta http-equiv="refresh" content="120">--%>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        div#map_container {
            width: 690px;
            height: 400px;
        }
    </style>

    <title>Perekup64</title>

</head>

<body>

<%@ include file="/resources/template/menu-top.jsp" %>

<div class="container single-item-content">

    <link href=
          <c:url value="/resources/css/auction.css"/> rel="stylesheet" type="text/css">
    <link href=
          <c:url value="/resources/css/cars_elements.css"/> rel="stylesheet" type="text/css">
    <link href=
          <c:url value="/resources/css/star-rating.min.css"/> rel="stylesheet" type="text/css">
    <link href=
          <c:url value="/resources/css/accordion.css"/> rel="stylesheet" type="text/css">
    <link href=
          <c:url value="/resources/unite_gallery/css/unite-gallery.css"/> rel="stylesheet" type="text/css">
    <link href=
          <c:url value="/resources/unite_gallery/themes/default/ug-theme-default.css"/> rel="stylesheet"
          type="text/css">

    <sec:authorize ifAnyGranted="ROLE_ADMIN">
        <div class="col-md-offset-10 col-md-2">
            <a href="/update-auction/${auction.auctionid}" class="btn btn-warning">Изменить лот</a>
        </div>
    </sec:authorize>

    <div class="row">
        <div class="col-xs-12 single-content-right">

            <%--UNITE GALLERY--%>
            <div class="col-md-12">
                <div id="gallery" style="display:none;">
                    <c:if test="${not empty images}">
                        <c:forEach items="${images}" var="image" varStatus="loop">
                            <img src="data:image/jpeg;base64,${image}">
                        </c:forEach>
                    </c:if>
                    <img alt="Примерчик как на перекупе будут выглядеть видосы"
                         data-type="youtube"
                         data-videoid="hrxbnlxn6FU"
                         data-description="Офигительный видос про секвою с ютуба для примерчика">
                </div>
            </div>
            <%--UNITE GALLERY--%>

            <div class="col-md-12">
                <h2 class="text-uppercase title">${auction.name}</h2>
                <div id="soldto-div" class="hidden">
                    <div class="alert alert-success">
                        <span id="soldto"></span>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">Стартовая цена</h4>
                    </div>
                    <div class="panel-body">
                        <div class="price-number text-center">${auction.firstBid} 000 Руб</div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">Дата начала</h4>
                    </div>
                    <div class="panel-body">
                        <span class="date-number text-center">${auction.started}</span>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">Дата окончания</h4>
                    </div>
                    <div class="panel-body">
                        <span class="date-number text-center">${auction.ends}</span>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="clock-div panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">Закончится через</h4>
                    </div>
                    <div class="panel-body" style="text-align: center;">
                        <div class="lead clock" id="clock" class="clock"></div>
                    </div>
                </div>
            </div>
            <div id="bid-pricing" class="col-md-6 <c:if test='${empty user}'>hidden</c:if>">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">Текущая цена</h4>
                    </div>
                    <div class="panel-body">
                        <div class="price-number text-center"><span
                                id="currentPrice">${auction.firstBid} 000 Руб</span>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <c:if test="${user.approved == 1}">
                            <c:if test="${user.userid != auction.user.userid}">
                                <b>
                                    <c:choose>
                                        <c:when test="${empty auction.buyer}">
                                            <button type="button" class="btn btn-primary btn-block" id="nextBid"
                                                    style="font-weight : bold">
                                                ПРИНЯТЬ НАЧАЛЬНУЮ СТАВКУ ${auction.currently} Руб
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button" class="btn btn-primary btn-block" id="nextBid"
                                                    disabled="true" style="font-weight : bold">
                                                СДЕЛАТЬ СТАВКУ ${auction.currently + 1} Руб
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </b>
                            </c:if>
                        </c:if>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <c:if test="${auction.buyPrice != null}">
                <div id="buy-pricing" class="col-md-6 <c:if test='${empty user}'>hidden</c:if>">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Купить без торга можно за</h4>
                        </div>
                        <div class="panel-body">
                            <div class="price-number text-center">${auction.buyPrice} 000 Руб</div>
                        </div>
                        <div class="panel-footer">
                            <c:if test="${user.approved == 1}">
                                <c:if test="${user.userid != auction.user.userid}">
                                    <button class="btn btn-primary btn-block" data-toggle="modal"
                                            data-target="#buyModal"><b>КУПИТЬ БЕЗ ТОРГА</b></button>
                                </c:if>
                            </c:if>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:if>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">Последние ставки</h4>
                    </div>
                    <div class="panel-body">
                        <ul id="liveFeed" class="list-group"></ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bid Modal -->
    <div class="modal fade" id="bidModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Подтверждение</h4>
                </div>
                <div class="modal-body" style="line-height: 1">
                    <p>Вы уверены, что хотите повысить ставку?</p>
                    <p>Ваша ставка лидирует!</p>
                </div>
                <div class="modal-footer">
                    <button id="bidButton" type="button" class="btn btn-primary" data-dismiss="modal">Продолжить
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                </div>
            </div>

        </div>
    </div>
    <!-- Buy Modal -->
    <div class="modal fade" id="buyModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Подтверждение</h4>
                </div>
                <div class="modal-body" style="line-height: 1">
                    <p>Вы уверены, что хотите продолжить?</p>
                    <p>Это действие нельзя будет отменить!</p>
                </div>
                <div class="modal-footer">
                    <button id="buy-button" type="button" class="btn btn-primary" data-dismiss="modal">Продолжить
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                </div>
            </div>

        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <button class="accordion">ПОДРОБНЕЕ</button>
            <div class="panel_accordion">
                <div class="col-sm-4">
                    <table>
                        <c:if test="${not empty auction.brand}">
                            <tr class="border_bottom">
                                <td>Марка: ${auction.brand}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.model}">
                            <tr class="border_bottom">
                                <td>Модель: ${auction.model}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.released}">
                            <tr class="border_bottom">
                                <td>Год выпуска: ${auction.released}</td>

                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.run}">
                            <tr class="border_bottom">
                                <td>Пробег: ${auction.run}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.engineType}">
                            <tr class="border_bottom">
                                <td>Двигатель: ${auction.engineType}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.engineState}">
                            <tr class="border_bottom">
                                <td>Состояние двигателя: ${auction.engineState}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.transmission}">
                            <tr class="border_bottom">
                                <td>Коробка: ${auction.transmission}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.body}">
                            <tr class="border_bottom">
                                <td>Кузов: ${auction.body}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.bodyState}">
                            <tr class="border_bottom">
                                <td>Состояние кузова: ${auction.bodyState}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.drive}">
                            <tr class="border_bottom">
                                <td>Привод: ${auction.drive}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.power}">
                            <tr class="border_bottom">
                                <td>Мощность: ${auction.power}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.color}">
                            <tr class="border_bottom">
                                <td>Цвет: ${auction.color}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.doors}">
                            <tr class="border_bottom">
                                <td>Дверей: ${auction.doors}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.owners}">
                            <tr class="border_bottom">
                                <td>Владельцев по птс: ${auction.owners}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.vin}">
                            <tr class="border_bottom">
                                <td>VIN: ${auction.vin}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.gibdd}">
                            <tr class="border_bottom">
                                <td>База ГИБДД РФ: ${auction.gibdd}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.fssp}">
                            <tr class="border_bottom">
                                <td>База судебных приставов: ${auction.fssp}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.driveState}">
                            <tr class="border_bottom">
                                <td>Cостояние ходовой: ${auction.driveState}</td>
                            </tr>
                        </c:if>
                    </table>
                </div>
                <div class="col-sm-8">
                    <div>
                        <div class="img_outer_container">
                            <div class="img_inner_container">
                                <img class="trafaret"
                                     src="<c:url value="/resources/images/cars_elements/background.png"/>"/>
                                <c:forEach var="code" items="${auction.listOfDamagedElements}" varStatus="loop">
                                    <img class="zakraska"
                                         src="<c:url value="/resources/images/cars_elements/${code}.png"/>"/>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--</div>--%>

            <button class="accordion">ДОПОЛНИТЕЛЬНАЯ ИНФОРМАЦИЯ</button>
            <div class="panel_accordion">
                <div class="col-sm-6">
                    <table style="width: 100%;">
                        <c:if test="${not empty auction.auctionMoreInfo.powerSteering}">
                            <tr class="border_bottom">
                                <td>Усилитель руля: ${auction.auctionMoreInfo.powerSteering}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.climateControl}">
                            <tr class="border_bottom">
                                <td>Управление климатом: ${auction.auctionMoreInfo.climateControl}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.controlOnWheel}">
                            <tr class="border_bottom">
                                <td>Мультируль</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.leatherWheel}">
                            <tr class="border_bottom">
                                <td>Отделка руля и рукоятки кпп кожей</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.heatedWheel}">
                            <tr class="border_bottom">
                                <td>Подогрев руля</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.heatedSeats}">
                            <tr class="border_bottom">
                                <td>Обогрев сидений: ${auction.auctionMoreInfo.heatedSeats}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.heatedMirrors}">
                            <tr class="border_bottom">
                                <td>Электро обогрев и электро настройка зеркал</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.powerWindows}">
                            <tr class="border_bottom">
                                <td>Электростеклоподъемники: ${auction.auctionMoreInfo.powerWindows}</td>

                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.powerSeatsFront}">
                            <tr class="border_bottom">
                                <td>Электропривод передних сидений</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.rainSensor}">
                            <tr class="border_bottom">
                                <td>Датчик дождя</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.frontParkingSensors}">
                            <tr class="border_bottom">
                                <td>Датчики парковки передний</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.rearParkingSensors}">
                            <tr class="border_bottom">
                                <td>Датчики парковки задний</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.cruiseControl}">
                            <tr class="border_bottom">
                                <td>Круиз-контроль: ${auction.auctionMoreInfo.cruiseControl}</td>
                            </tr>
                        </c:if>
                    </table>
                </div>
                <div class="col-sm-6">
                    <table style="width: 100%;">
                        <c:if test="${not empty auction.auctionMoreInfo.onBoardComputer}">
                            <tr class="border_bottom">
                                <td>Бортовой компьютер</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.alarm}">
                            <tr class="border_bottom">
                                <td>Сигнализация: ${auction.auctionMoreInfo.alarm}</td>

                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.airbags}">
                            <tr class="border_bottom">
                                <td>Подушки безопасности</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.abs}">
                            <tr class="border_bottom">
                                <td>Антиблокировочная система тормозов ABS</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.directionalStability}">
                            <tr class="border_bottom">
                                <td>Система курсовой устойчивости ESP</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.antiSlip}">
                            <tr class="border_bottom">
                                <td>Противобуксовочная система TCS</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.carStereo}">
                            <tr class="border_bottom">
                                <td>Магнитола: ${auction.auctionMoreInfo.carStereo}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.audioSystem}">
                            <tr class="border_bottom">
                                <td>Аудиоколонки: ${auction.auctionMoreInfo.audioSystem} шт.</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.backCamera}">
                            <tr class="border_bottom">
                                <td>Камера заднего вида</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.headlights}">
                            <tr class="border_bottom">
                                <td>Головная оптика: ${auction.auctionMoreInfo.headlights}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.wheels}">
                            <tr class="border_bottom">
                                <td>Размер колес: ${auction.auctionMoreInfo.wheels}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.winterTires}">
                            <tr class="border_bottom">
                                <td>Зимние шины</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.vehicleLogBook}">
                            <tr class="border_bottom">
                                <td>Сервисная книжка</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                        <c:if test="${not empty auction.auctionMoreInfo.warrantyOn}">
                            <tr class="border_bottom">
                                <td>Заводская гарантия</td>
                                    <%--<td>есть</td>--%>
                            </tr>
                        </c:if>
                    </table>
                </div>
            </div>

            <button class="accordion">ПРОВЕРКА ПО БАЗАМ</button>
            <div class="panel_accordion">
                <p>
                    В процессе реализации
                </p>
            </div>
            <button class="accordion">КОНТАКТНЫЕ ДАННЫЕ</button>
            <div class="panel_accordion">
                <p>Отдел продаж</p>
                <div class="col-sm-6">
                    менеджер <br/>
                    <span class="icon-phone"></span> ${auction.user.phone} <br/><br/>
                    ${auction.user.city}
                </div>
                <div class="col-sm-6">
                    <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
                    </sec:authorize>
                </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="/resources/template/footer.jsp" %>

<script src=<c:url value="/resources/js/auction.js"/>></script>
<script src=<c:url value="/resources/js/jquery.countdown.min.js"/>></script>
<script src=<c:url value="/resources/js/auction-carousels.js"/>></script>
<script src=<c:url value="/resources/js/date.format.js"/>></script>
<script src=<c:url value="/resources/js/bootstrap-confirmation.js"/>></script>
<script src=<c:url value="/resources/js/star-rating.min.js"/>></script>

<script src=<c:url value="/resources/unite_gallery/js/jquery-11.0.min.js"/>></script>
<script src=<c:url value="/resources/unite_gallery/js/unitegallery.min.js"/>></script>
<script src=<c:url value="/resources/unite_gallery/themes/default/ug-theme-default.js"/>></script>
<%--<script src=<c:url value="/resources/unite_gallery/themes/slider/ug-theme-slider.js"/>></script>--%>

<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery("#gallery").unitegallery(
            {
                //theme options

                theme_enable_fullscreen_button: true,	//show, hide the theme fullscreen button. The position in the theme is constant
                theme_enable_play_button: true,			//show, hide the theme play button. The position in the theme is constant
                theme_enable_hidepanel_button: true,	//show, hide the hidepanel button
                theme_enable_text_panel: true,			//enable the panel text panel.

                theme_text_padding_left: 20,			//left padding of the text in the textpanel
                theme_text_padding_right: 5,			//right paddin of the text in the textpanel
                theme_text_align: "left",				//left, center, right - the align of the text in the textpanel
                theme_text_type: "title",				//title, description - text that will be shown on the text panel, title or description

                theme_hide_panel_under_width: 480,		//hide panel under certain browser width, if null, don't hide

                // gallery options

                gallery_width: 1300,							//gallery width
                gallery_height: 500,							//gallery height

                // gallery_min_width: 400,						//gallery minimal width when resizing
                // gallery_min_height: 300,					//gallery minimal height when resizing

                gallery_skin: "default",						//default, alexis etc... - the global skin of the gallery. Will change all gallery items by default.

                gallery_images_preload_type: "minimal",		//all , minimal , visible - preload type of the images.
                //minimal - only image nabours will be loaded each time.
                //visible - visible thumbs images will be loaded each time.
                //all - load all the images first time.

                gallery_autoplay: false,						//true / false - begin slideshow autoplay on start
                gallery_play_interval: 3000,				//play interval of the slideshow
                gallery_pause_on_mouseover: true,			//true,false - pause on mouseover when playing slideshow true/false

                gallery_control_thumbs_mousewheel: false,	//true,false - enable / disable the mousewheel
                gallery_control_keyboard: true,				//true,false - enable / disble keyboard controls
                gallery_carousel: true,						//true,false - next button on last image goes to first image.

                gallery_preserve_ratio: true,				//true, false - preserver ratio when on window resize
                gallery_debug_errors: false,					//show error message when there is some error on the gallery area.
                gallery_background_color: "",				//set custom background color. If not set it will be taken from css.

                //slider options:

                slider_scale_mode: "fit",					//fit: scale down and up the image to always fit the slider
                //down: scale down only, smaller images will be shown, don't enlarge images (scale up)
                //fill: fill the entire slider space by scaling, cropping and centering the image
                slider_scale_mode_media: "fill",			//fit, down, full scale mode on media items
                slider_scale_mode_fullscreen: "down",		//fit, down, full scale mode on fullscreen.
                slider_item_padding_top: 0,					//padding top of the slider item
                slider_item_padding_bottom: 0,				//padding bottom of the slider item
                slider_item_padding_left: 0,				//padding left of the slider item
                slider_item_padding_right: 0,				//padding right of the slider item

                slider_transition: "slide",					//fade, slide - the transition of the slide change
                slider_transition_speed: 300,				//transition duration of slide change
                slider_transition_easing: "easeInOutQuad",	//transition easing function of slide change

                slider_control_swipe: true,					//true,false - enable swiping control
                slider_control_zoom: true,					//true, false - enable zooming control
                slider_zoom_max_ratio: 6,					//max zoom ratio
                slider_loader_type: 1,						//shape of the loader (1-7)
                slider_loader_color: "white",				//color of the loader: (black , white)

                slider_enable_bullets: false,				//enable the bullets onslider element
                slider_bullets_skin: "",					//skin of the bullets, if empty inherit from gallery skin
                slider_bullets_space_between: -1,			//set the space between bullets. If -1 then will be set default space from the skins
                slider_bullets_align_hor: "center",			//left, center, right - bullets horizontal align
                slider_bullets_align_vert: "bottom",			//top, middle, bottom - bullets vertical algin
                slider_bullets_offset_hor: 0,				//bullets horizontal offset
                slider_bullets_offset_vert: 10,				//bullets vertical offset

                slider_enable_arrows: true,					//enable arrows onslider element
                slider_arrows_skin: "",						//skin of the slider arrows, if empty inherit from gallery skin

                slider_arrow_left_align_hor: "left",	  		//left, center, right - left arrow horizonal align
                slider_arrow_left_align_vert: "middle", 		//top, middle, bottom - left arrow vertical align
                slider_arrow_left_offset_hor: 20,		  	//left arrow horizontal offset
                slider_arrow_left_offset_vert: 0,		  	//left arrow vertical offset

                slider_arrow_right_align_hor: "right",   	//left, center, right - right arrow horizontal algin
                slider_arrow_right_align_vert: "middle", 	//top, middle, bottom - right arrow vertical align
                slider_arrow_right_offset_hor: 20,	   		//right arrow horizontal offset
                slider_arrow_right_offset_vert: 0,	   		//right arrow vertical offset

                slider_enable_progress_indicator: true,		 //enable progress indicator element
                slider_progress_indicator_type: "pie",		 //pie, pie2, bar (if pie not supported, it will switch to bar automatically)
                slider_progress_indicator_align_hor: "left",  //left, center, right - progress indicator horizontal align
                slider_progress_indicator_align_vert: "top",  //top, middle, bottom - progress indicator vertical align
                slider_progress_indicator_offset_hor: 16,	 //progress indicator horizontal offset
                slider_progress_indicator_offset_vert: 36,	 //progress indicator vertical offset

                slider_progressbar_color: "#ffffff",			 //progress bar color
                slider_progressbar_opacity: 0.6,			 //progress bar opacity
                slider_progressbar_line_width: 5,			 //progress bar line width

                slider_progresspie_type_fill: false,		 //false is stroke, true is fill - the progress pie type, stroke of fill
                slider_progresspie_color1: "#B5B5B5", 		 //the first color of the progress pie
                slider_progresspie_color2: "#E5E5E5",		 //progress pie second color
                slider_progresspie_stroke_width: 6,			 //progress pie stroke width
                slider_progresspie_width: 30,				 //progess pie width
                slider_progresspie_height: 30,				 //progress pie height

                slider_enable_play_button: true,			 //true,false - enable play / pause button onslider element
                slider_play_button_skin: "",				 //skin of the slider play button, if empty inherit from gallery skin
                slider_play_button_align_hor: "left",    	 //left, center, right - play button horizontal align
                slider_play_button_align_vert: "top",         //top, middle, bottom - play button vertical align
                slider_play_button_offset_hor: 40,	       	 //play button horizontal offset
                slider_play_button_offset_vert: 8,	   		 //play button vertical offset

                slider_enable_fullscreen_button: false,		 //true,false - enable fullscreen button onslider element
                // slider_fullscreen_button_skin: "",			 //skin of the slider fullscreen button, if empty inherit from gallery skin
                // slider_fullscreen_button_align_hor:"left",   //left, center, right	- fullscreen button horizonatal align
                // slider_fullscreen_button_align_vert:"top",   //top, middle, bottom - fullscreen button vertical align
                // slider_fullscreen_button_offset_hor:11,	     //fullscreen button horizontal offset
                // slider_fullscreen_button_offset_vert:9,	   	 //fullscreen button vertical offset

                slider_enable_zoom_panel: true,				 //true,false - enable the zoom buttons, works together with zoom control.
                slider_zoompanel_skin: "",					 //skin of the slider zoom panel, if empty inherit from gallery skin
                slider_zoompanel_align_hor: "right",    		 //left, center, right - zoom panel horizontal align
                slider_zoompanel_align_vert: "top",     	 	 //top, middle, bottom - zoom panel vertical align
                slider_zoompanel_offset_hor: 12,	       		 //zoom panel horizontal offset
                slider_zoompanel_offset_vert: 10,	   	     //zoom panel vertical offset

                slider_controls_always_on: true,		     //true,false - controls are always on, false - show only on mouseover
                slider_controls_appear_ontap: true,			 //true,false - appear controls on tap event on touch devices
                slider_controls_appear_duration: 300,		 //the duration of appearing controls
                slider_videoplay_button_type: "square",		  //square, round - the videoplay button type, square or round

                slider_enable_text_panel: false,			 //true,false - enable the text panel
                slider_textpanel_always_on: true,			 //true,false - text panel are always on, false - show only on mouseover

                slider_textpanel_text_valign: "middle",			//middle, top, bottom - text vertical align
                slider_textpanel_padding_top: 10,				//textpanel padding top
                slider_textpanel_padding_bottom: 10,				//textpanel padding bottom
                slider_textpanel_height: null,					//textpanel height. if null it will be set dynamically
                slider_textpanel_padding_title_description: 5,	//the space between the title and the description
                slider_textpanel_padding_right: 11,				//cut some space for text from right
                slider_textpanel_padding_left: 11,				//cut some space for text from left
                slider_textpanel_fade_duration: 200,			//the fade duration of textpanel appear
                slider_textpanel_enable_title: true,			//enable the title text
                slider_textpanel_enable_description: true,		//enable the description text
                slider_textpanel_enable_bg: true,				//enable the textpanel background
                slider_textpanel_bg_color: "#000000",			//textpanel background color
                slider_textpanel_bg_opacity: 0.4,				//textpanel background opacity

                slider_textpanel_title_color: null,				//textpanel title color. if null - take from css
                slider_textpanel_title_font_family: null,		//textpanel title font family. if null - take from css
                slider_textpanel_title_text_align: null,			//textpanel title text align. if null - take from css
                slider_textpanel_title_font_size: null,			//textpanel title font size. if null - take from css
                slider_textpanel_title_bold: null,				//textpanel title bold. if null - take from css
                slider_textpanel_css_title: {},					//textpanel additional css of the title

                slider_textpanel_desc_color: null,				//textpanel description font family. if null - take from css
                slider_textpanel_desc_font_family: null,			//textpanel description font family. if null - take from css
                slider_textpanel_desc_text_align: null,			//textpanel description text align. if null - take from css
                slider_textpanel_desc_font_size: null,			//textpanel description font size. if null - take from css
                slider_textpanel_desc_bold: null,				//textpanel description bold. if null - take from css
                slider_textpanel_css_description: {},			//textpanel additional css of the description

                slider_textpanel_bg_css: {},						//textpanel background css

                //thumbs options

                thumb_width: 88,								//thumb width
                thumb_height: 50,							//thumb height
                thumb_fixed_size: true,						//true,false - fixed/dynamic thumbnail width

                thumb_border_effect: true,					//true, false - specify if the thumb has border
                thumb_border_width: 0,						//thumb border width
                thumb_border_color: "#000000",				//thumb border color
                thumb_over_border_width: 0,					//thumb border width in mouseover state
                thumb_over_border_color: "#d9d9d9",			//thumb border color in mouseover state
                thumb_selected_border_width: 1,				//thumb width in selected state
                thumb_selected_border_color: "#d9d9d9",		//thumb border color in selected state

                thumb_round_corners_radius: 0,				//thumb border radius

                thumb_color_overlay_effect: true,			//true,false - thumb color overlay effect, release the overlay on mouseover and selected states
                thumb_overlay_color: "#000000",				//thumb overlay color
                thumb_overlay_opacity: 0.4,					//thumb overlay color opacity
                thumb_overlay_reverse: false,				//true,false - reverse the overlay, will be shown on selected state only

                thumb_image_overlay_effect: false,			//true,false - images overlay effect on normal state only
                thumb_image_overlay_type: "bw",				//bw , blur, sepia - the type of image effect overlay, black and white, sepia and blur.

                thumb_transition_duration: 200,				//thumb effect transition duration
                thumb_transition_easing: "easeOutQuad",		//thumb effect transition easing

                thumb_show_loader: true,						//show thumb loader while loading the thumb
                thumb_loader_type: "dark",					//dark, light - thumb loader type

                //stript thumbs panel options

                strippanel_padding_top: 8,					//space from top of the panel
                strippanel_padding_bottom: 8,				//space from bottom of the panel

                strippanel_padding_left: 0,				//space from left of the panel
                strippanel_padding_right: 0,				//space from right of the panel

                strippanel_enable_buttons: false,			//enable buttons from the sides of the panel
                strippanel_buttons_skin: "",				//skin of the buttons, if empty inherit from gallery skin
                strippanel_padding_buttons: 2,				//padding between the buttons and the panel

                strippanel_buttons_role: "scroll_strip",   // scroll_strip, advance_item - the role of the side buttons

                strippanel_enable_handle: true,				//enable grid handle
                strippanel_handle_align: "top",				//top, middle, bottom , left, right, center - close handle tip align on the handle bar according panel orientation
                strippanel_handle_offset: 0,				//offset of handle bar according the valign
                strippanel_handle_skin: "",					//skin of the handle, if empty inherit from gallery skin

                strippanel_background_color: "",				//background color of the strip wrapper, if not set, it will be taken from the css

                strip_thumbs_align: "left",					//left, center, right, top, middle, bottom - the align of the thumbs when they smaller then the strip size.
                strip_space_between_thumbs: 6,				//space between thumbs
                strip_thumb_touch_sensetivity: 15,  			//from 1-100, 1 - most sensetive, 100 - most unsensetive
                strip_scroll_to_thumb_duration: 500,			//duration of scrolling to thumb
                strip_scroll_to_thumb_easing: "easeOutCubic", //easing of scrolling to thumb animation
                strip_control_avia: true,					//avia control - move the strip according strip moseover position
                strip_control_touch: true,					//touch control - move the strip by dragging it
                // thumb_image_overlay_effect: true,
                // thumb_image_overlay_type: "sepia",
                // thumb_width:120,
                // thumb_height:70,
                // slider_enable_fullscreen_button: true
            }
        );
    });

</script>

<script>

    auctionId = "${auction.auctionid}";

    ends = "${ends}";

    /* Asychronous check of Bids */
    numberofBids = 0;

    myBidIsLast = false;

    stopFlag = 0;

    function pollforBids() {

        if (stopFlag == 1)   // Recursive returns
            return;

        var url = "/checkBids/" + auctionId

        if (request) {
            request.abort();  // abort any pending request
        }

        console.log("Polling for bids");

        var request = $.ajax({
            url: url,
            type: "GET",
            data: {numofBids: numberofBids},
            timeout: 45000,
            success: function (data) {
                myBidIsLast = data.info.lastBidIsMy;
                console.log("myBidIsLast: " + myBidIsLast);
                console.log("No new bids: " + data.info.buyer);
                if (data.info.bought) {
                    if (data.info.buyer == null)
                        updateOver();
                    else
                        updateBought(data);
                }
                else {
                    myBidIsLast = data.info.lastBidIsMy;
                    console.log("myBidIsLast: " + myBidIsLast);
                    console.log('New bids: ' + (data.info.numofBids - numberofBids));
                    console.log(data.bids);
                    numberofBids = data.info.numofBids;
                    console.log(data.info.buyer);
                    if (data.info.bought)
                        updateBought(data);
                }
                updatePriceAndLiveFeed(data);
                pollforBids();  // Recursion
            },
            error: function (data) {
                console.log("pollforBids: ERROR: " + data.responseText);
                stopFlag = 1;
            }
        });
    }


    function pollforBidsSingle() {

        console.log("myBisIsLast: " + myBidIsLast);

        if (stopFlag == 1)   // Recursive returns
            return;

        var url = "/checkBids/" + auctionId

        if (request) {
            request.abort();  // abort any pending request
        }

        console.log("Polling for bids");

        var request = $.ajax({
            url: url,
            type: "GET",
            data: {numofBids: numberofBids},
            timeout: 45000,
            success: function (data) {
                myBidIsLast = data.info.lastBidIsMy;
                console.log("myBidIsLast: " + myBidIsLast);
                console.log("No new bids: " + data.info.buyer);
                if (data.info.bought) {
                    if (data.info.buyer == null)
                        updateOver();
                    else
                        updateBought(data);
                }
                else {
                    myBidIsLast = data.info.lastBidIsMy;
                    console.log('New bids: ' + (data.info.numofBids - numberofBids));
                    console.log(data.bids);
                    numberofBids = data.info.numofBids;
                    console.log(data.info.buyer);
                    if (data.info.bought)
                        updateBought(data);
                }
                updatePriceAndLiveFeed(data);
            },
            error: function (data) {
                console.log("pollforBids: ERROR: " + data.responseText);
                stopFlag = 1;
            }
        });
    }

    function updatePriceAndLiveFeed(data) {
        var latestBid = data.info.latestBid;
        if (latestBid > 2) {
            $('#currentPrice').text(data.info.latestBid + " 000 Руб");
        }
        var bid = data.info.latestBid + 1;
        if (bid > 2) {
            $('#nextBid').text("СДЕЛАТЬ СТАВКУ " + bid + " 000 Руб");
            $('#nextBid').removeAttr("disabled");
        }
        var bids = data.bids;
        var bid;
        var i;
        if (bids.length > 0) {
            $('#liveFeed').empty();
        }
        for (i = bids.length - 1; i >= 00; i--) {
            bid = bids[i];
            console.log('Name: ' + bid.username);
            var time = new Date(bid.time);
            var formattedTime = time.format("isoTime");

            $('#liveFeed').prepend('<li class="list-group-item">' + formattedTime + ' ' + bid.username + ' перебил ставкой ' + bid.amount + '000 Руб</li>');
        }
    }

    function updateBought(data) {
        $('.clock-div').addClass('hidden');
        $('#soldto').text("Аукцион выигран участником " + data.info.buyer + " с конечной ценой " + data.info.latestBid + " 000 Руб");
        $('#soldto-div').removeClass('hidden');
        $('#bid-pricing').addClass('hidden');
        $('#buy-pricing').addClass('hidden');

        stopFlag = 1;
    }

    function updateOver() {
        $('.clock-div').addClass('hidden');
        $('#soldto').text("The Auction has ended without any buyers.");
        $('#soldto-div').removeClass('hidden');
        $('#bid-pricing').addClass('hidden');
        $('#buy-pricing').addClass('hidden');

        stopFlag = 1;
    }

    window.addEventListener('load',
        function () {
            pollforBids();
        }, false);

    /* Function to ajax post the bid */
    function bidPost() {
        var bidUrl = "/auction/bid/" + auctionId;

        // var amount = $('#bidInput').val();
        var amount = 1; //hardcode!!!
        console.log("Amount: " + amount);

        $.ajax({
            url: bidUrl,
            type: "POST",
            data: {bidAmount: amount},
            success: function (data) {
                console.log("bidPost: " + data);
            },
            error: function (data) {
                console.log("ERROR: " + data.responseText);
            }
        });
        pollforBidsSingle();
    }

    <c:if test="${auction.buyPrice != null}">
    /* Function to ajax post the purchase */
    function buyPost() {

        var bidUrl = "/auction/bid/" + auctionId;

        var amount = ${auction.buyPrice};
        console.log("Amount: " + amount);

        $.ajax({
            url: bidUrl,
            type: "POST",
            data: {bidAmount: amount},
            success: function (data) {
                console.log("bidPost: " + data);
            },
            error: function (data) {
                console.log("ERROR: " + data.responseText);
            }
        });
    }

    </c:if>

    /* Google Maps */
    <c:if test="${not empty auction.location.latitude}">
    var lat = ${auction.location.latitude},
        long = ${auction.location.longitude};

    function loadMap() {

        if (lat.length == 0) // If latitude is not given no google maps
            return;


        var latlng = new google.maps.LatLng(lat, long);
        var myOptions = {
            zoom: 4,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map_container"), myOptions);

        var marker = new google.maps.Marker({
            position: latlng,
            map: map,
            title: "Auction Location"
        });
    }

    </c:if>

    /* Confirmation */

    /* On button click call bidPost() */
    $('#nextBid').on('click', function () {
        if (myBidIsLast) {
            $('#bidModal').modal();
        } else {
            $('#nextBid').attr("disabled", true);
            $('#nextBid').text("ОБРАБОТКА ЗАПРОСА");
            console.log("nextBid clicked")
            bidPost();
            console.log(numberofBids + "numberofBids")
        }
        pollforBids();
    });

    $('#bidButton').on('click', function () {
        $('#nextBid').attr("disabled", true);
        $('#nextBid').text("ОБРАБОТКА ЗАПРОСА");
        console.log("bidButton clicked")
        bidPost();
        console.log(numberofBids + "numberofBids")
        pollforBids();
    });

    /* Buy Auction */
    $('#buy-button').on('click', function () {
        console.log("buy-button clicked")
        buyPost();
    });

    /* Rating */
    <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
    $('#seller-rating').on('rating.change', function (event, value, caption) {
        console.log(value);
        sellerRatingPost(value);
    });

    $('#bidder-rating').on('rating.change', function (event, value, caption) {
        console.log(value);
        bidderRatingPost(value);
    });

    userId = "${auction.user.userid}";

    /* Function to ajax post the Seller Rating */
    function sellerRatingPost(value) {

        var url = "/rate/seller/" + userId;

        $.ajax({
            url: url,
            type: "POST",
            data: {rating: value},
            success: function (data) {
                console.log("ratingPost: " + data);
            },
            error: function (data) {
                console.log("ERROR: " + data.responseText);
            }
        });
    }

    /* Function to ajax post the Bidder Rating */
    function bidderRatingPost(value) {

        var url = "/rate/bidder/" + userId;

        $.ajax({
            url: url,
            type: "POST",
            data: {rating: value},
            success: function (data) {
                console.log("ratingPost: " + data);
            },
            error: function (data) {
                console.log("ERROR: " + data.responseText);
            }
        });
    }

    </sec:authorize>

</script>
<script>
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    }
</script>


<c:if test="${not empty auction.location.latitude}">
    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDluUfh1eXZmSKvXQJ1Ctd9nYucJgPIcVo&callback=loadMap"
            async defer></script>
</c:if>
<script src=<c:url value="/resources/js/auction.js"/>></script>

</body>

</html>
