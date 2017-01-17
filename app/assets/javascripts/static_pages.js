+function($){
    "use strict";
    
        $('.cal-heatmap').each(function(i,e){
            var cal = new CalHeatMap();
            cal.init(initCalHeatMap($(e).attr("id"),$(e).data("start-date"),$(e).data("end-date")));
        });
        

        function initCalHeatMap(id,startDate,endDate){
            var sd = new Date(startDate), ed = new Date(endDate);
            return {
                data: buildData(sd,ed),
                displayLegend: false,
                domain: "month",
                itemSelector: "#"+id,
                maxDate:ed,
                minDate:sd,
                range: Math.ceil((((((ed.getTime() - sd.getTime())/1000)/60)/60)/24)/30)+1,
                start: sd,
                subDomain: "x_day",
               	subDomainTextFormat: "%d",
                legendColors: {
                    min: "white",
                    max: "#ff8855",
                },
            };
        }
        
        function buildData(startDate,endDate){
            var data = {};
            for(var i = startDate.getTime()/1000; i <= (86400 + endDate.getTime()/1000);){
                data[i] = 50;
                i += 86400;
            }
            return data;
        }
}(jQuery)