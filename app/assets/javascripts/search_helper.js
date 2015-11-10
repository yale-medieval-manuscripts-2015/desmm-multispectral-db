/**
 * Created by rlechich on 11/10/15.
 */

$('.toggle_manifests').each(function() {
    var $toggle = $(this);
    var $checkboxes = $toggle.parent().siblings().children()

    $toggle.change(function() {
        if (this.checked) {
            $checkboxes.prop('checked', 'checked');
        } else {
            $checkboxes.prop('checked', false);
        }
});
    $checkboxes.change(function() {
        if (this.checked) {
            if ($checkboxes.length == $checkboxes.filter(':checked').length) {
                $toggle.prop('checked', 'checked');
            }
        } else {
            $toggle.prop('checked',false);
            }
            }).eq(0).trigger('change');
        });
$('.toggle_tags').each(function() {
    var $toggle = $(this);
    var $checkboxes = $toggle.parent().siblings().children()

    $toggle.change(function() {
        if (this.checked) {
            $checkboxes.prop('checked', 'checked');
        } else {
            $checkboxes.prop('checked', false);
        }
    });
    $checkboxes.change(function() {
        if (this.checked) {
            if ($checkboxes.length == $checkboxes.filter(':checked').length) {
                $toggle.prop('checked', 'checked');
            }
        } else {
            $toggle.prop('checked',false);
        }
    }).eq(0).trigger('change');
});