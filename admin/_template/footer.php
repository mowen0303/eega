</div>
<!-- /.container-fluid -->
<footer class="footer text-center"> 2023 &copy; V-TEC (v0.0.1)</footer>
</div>
<!-- ============================================================== -->
<!-- End Page Content -->
<!-- ============================================================== -->
</div>
<!-- /#wrapper -->
<script>
    $(function() {

        $('#select-all').click(function() {
            $('#select-school').multiSelect('select_all');
            return false;
        });
        $('#deselect-all').click(function() {
            $('#select-school').multiSelect('deselect_all');
            return false;
        });
        // For select 2
        $(".erpSelect2").select2({
            placeholder: "-- Select --",
            templateResult: select2FormatState,
            templateSelection: select2FormatState
        });

        //lightbox
        $(document).on('click', '[data-toggle="lightbox"]', function(event) {
            event.preventDefault();
            $(this).ekkoLightbox({
                wrapping: false,
                showArrows: true,
            });
        });

        //print
        $(".print").click(function(){
            let options = {
                mode: 'iframe', //popup / iframe
                popClose: false
            };
            $(this).parents(".printableArea").printArea(options);
        })
    });
    // Date Picker
    jQuery('#datepicker-autoclose').datepicker({
        autoclose: true,
        todayHighlight: true,
        format: 'yyyy-mm-dd',
        orientation: 'bottom',
    });
</script>
</body>
</html>
<?php
echo ob_get_clean();
?>