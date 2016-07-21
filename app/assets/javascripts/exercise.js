$(document).on("turbolinks:load", function() {
	$("#exercise_workout_date").datepicker( { dateFormat: 'yy-mm-dd' });
	
	new Morris.Line({
		// ID of the element in which to draw the chart.
		element: 'chart',
		// Chart data records -- each entry in this array corresponds to a point on
		// the chart.
		data: $("#chart").data("workouts"),
		// The name of the data record attribute that contains x-values.
		xkey: 'workout_date',
		// A list of names of data record attributes that contain y-values.
		ykeys: ['duration_in_min'],
		// Labels for the ykeys -- will be displayed when you hover over the
		// chart.
		labels: ['Duration'],
		xLabelAngle: 45,
		xLabels: "day",
		hideHover: true,
		xLabelFormat: function(x) {
			date_string = x.getFullYear() + "/" + parseInt(x.getMonth() + 1) + "/" + x.getDate();
			return date_string;
		},
		yLabelFormat: function(y) { return y.toString() + ' min'; }
	});
	
});
