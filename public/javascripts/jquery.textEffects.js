(function($) {
    function randomDNA() {
        var rnd = Math.floor(Math.random() * 3);
	if (rnd == 0) return 'A'
        else if (rnd == 1) return 'C'
        else if (rnd == 2) return 'T'
        else return 'G'
    }

    function randomBinary() {
        return Math.floor(Math.random() * 2);
    }

    
    $.fn.dnaDecrypt = function() {
        this.each(function() {
            var $ele = $(this), str = $ele.text(), progress = 0, replace = /[^\s]/g,
                random = randomDNA, inc = 3;
            $ele.text('');
            var timer = setInterval(function() {
                $ele.text(str.substring(0, progress) + str.substring(progress, str.length).replace(replace, random));
                progress += inc
                if (progress >= str.length + inc) clearInterval(timer);
            }, 100);
        });
        return this;
    };    

    $.fn.binaryDecrypt = function() {
        this.each(function() {
            var $ele = $(this), str = $ele.text(), progress = 0, replace = /[^\s]/g,
                random = randomBinary, inc = 3;
            $ele.text('');
            var timer = setInterval(function() {
                $ele.text(str.substring(0, progress) + str.substring(progress, str.length).replace(replace, random));
                progress += inc
                if (progress >= str.length + inc) clearInterval(timer);
            }, 100);
        });
        return this;
    };    
})(jQuery);
