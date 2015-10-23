<!--[if IE 9]>
<script src="/prototype/static/js/shim.js"></script>
<![endif]-->
<script src="/prototype/static/js/initial.js" data-inline></script>

<script>

    function randomIntFromInterval(min, max){
        min = parseInt(min, 10);
        max = parseInt(max, 10);
        return Math.floor(Math.random()*(max-min+1)+min);
    }

    var button = document.querySelectorAll('.iframe-buttons');
    [].slice.apply(button).forEach(function(b){

        b.addEventListener('click', function(e){
            e.preventDefault();
            e.stopPropagation();
            if(e.target.nodeName.toLowerCase() === 'button'){
                var data = e.target.dataset,
                    iframe = document.getElementById(data.target),
                    x = iframe.offsetWidth,
                    y = iframe.offsetHeight;

                // fixed width
                if(data.x && data.y) {
                    x = data.x;
                    y = data.y;
                }

                // random
                if(data.minX && data.minY && data.maxX && data.maxY){

                    // random X
                    x = randomIntFromInterval(data.minX, data.maxX);

                    // random Y
                    y = randomIntFromInterval(data.minY, data.maxY);

                }

                iframe.style.width = x + 'px';
                iframe.style.height = y + 'px';

            }
        });

    });
</script>