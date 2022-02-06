
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="${resouceUrl}/js/jquery.bxslider.js" type="text/javascript"></script>
<script src="${resouceUrl}/js/jquery.bxslider.min.js" type="text/javascript"></script>

<script src="${resouceUrl}/js/dropmenu.js" type="text/javascript"></script>

<script src="${resouceUrl}/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="${resouceUrl}/js/jquery.simple-sidebar.min.js" type="text/javascript"></script>

<script src="${resouceUrl}/js/slider.js" type="text/javascript"></script>

<%--<script>--%>
    <%--$(document).ready(function(){--%>
        <%--$('.bxslider').bxSlider({--%>
            <%--auto:true,--%>
            <%--controls: false,--%>
            <%--pager:true,--%>
        <%--});--%>

    <%--});--%>
<%--</script>--%>

<script>
    $(document).ready(function(){
        $('.bxslider').bxSlider({
            auto:true,
            controls: false,
            pager:true,
            speed:3000,
            pause:6000,
        });

    });
</script>

<script>
    $(document).ready(function(){
        $(".lang").mouseover(function(){
            $(".langDrop").css('display','block');
        })

        $(".langDrop").mouseleave(function(){
            $(".langDrop").css('display','none');
        })
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#main-sidebar').simpleSidebar({
            opener: '#toggle-sidebar',
            wrapper: '#main',
            animation: {
                easing: "easeOutQuint"
            },
            sidebar: {
                align: 'right',
                closingLinks: '.close-sb',
            },
            sbWrapper: {
                display: true
            }
        });
    });
</script>

<script type="text/javascript">
    $(function() {
        $("#m_plus1").click(function(){
            $("#m1").toggle();
        });

    });

    function f1()
    {
        $('#m_m1').toggle();
        $('#m_p1').toggle();
    }

    function f2()
    {
        $('#m_m2').toggle();
        $('#m_p2').toggle();
    }

    function f3()
    {
        $('#m_m3').toggle();
        $('#m_p3').toggle();
    }

    function f4()
    {
        $('#m_m4').toggle();
        $('#m_p4').toggle();
    }

</script>


<script>
    slider('.fullpage');
</script>


<%--<script type="text/javascript">--%>
    <%--$(function(){--%>
        <%--$(".term").click(function(){--%>
            <%--$(".term_modal").show();--%>
        <%--});--%>
    <%--});--%>

    <%--$(function(){--%>
        <%--$(".close").click(function(){--%>
            <%--$(".term_modal").hide();--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>


<%--<script>--%>
    <%--$(document).ready(function(){--%>
        <%--$(".family").mouseover(function(){--%>
            <%--$(".familyDrop").css('display','block');--%>
        <%--})--%>

        <%--$(".familyDrop").mouseleave(function(){--%>
            <%--$(".familyDrop").css('display','none');--%>
        <%--})--%>
    <%--});--%>
<%--</script>--%>

