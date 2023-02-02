<?php
try {
    global $userModel;
    global $place_arr;
    $rankModel = new \model\RankModel();
    $rankArr = $rankModel->getRank();
    $rankValue = 1;
} catch (Exception $e) {
    Helper::echoJson(0, $e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">EVENT / SCORE </h4>
    </div>
    <label class="col-sm-8 control-label">
        <a href="/admin/event/index.php?s=event-list" class="btn btn-info pull-right m-l-10">Back</a>
    </label>
</div>
<!--header end-->
<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <div class="row m-b-20">
                <div class="col-sm-12">
                    <h3 class="box-title m-b-0">RANK LIST</h3>
                </div>
            </div>
                <div class="table-responsive">
                    <table class="table orderTable color-table dark-table table-hover">
                        <thead>
                        <tr>
                            <th width="100" class="p-l-20">Rank</th>
                            <th width="150">AVATAR</th>
                            <th width="300">Name</th>
                            <th>HANDICAP INDEX</th>
                            <th>SCORE COUNT</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach ($rankArr as $row) {
                            ?>
                            <tr>
                                <td class="p-l-30"><?=$rankValue++?></td>
                                <td><div class="avatar avatar-40" style="background-image: url('<?=$row['user_avatar']?>')"></td>
                                <td><?=$row['user_first_name'] ?> <?=$row['user_last_name'] ?></td>
                                <td><?=$row['rank_handicap_index'] ?></td>
                                <td><?=$row['rank_history_count'] ?></td>
                            </tr>
                            <?php
                        }
                        ?>
                        </tbody>
                        </tbody>
                    </table>
                </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function(){

    $(".editScoreBtn").each(function(index){
        $(this).click(function(){
            const currentBtnDOM = $(this);
            const score = currentBtnDOM.parents('tr').find(".participantScore").text();
            const t = currentBtnDOM.parents('tr').find(".participantT").text();
            const participantId = currentBtnDOM.attr("data-participant-id");
            const html =`
                        <div class="modal-box">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h3 class="modal-title">Edit score</h3>
                            </div>
                            <div class="modal-body">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Score</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="participant_score" value="" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">T Type</label>
                                        <div class="col-sm-9">
                                            <select class="form-control participantTSelect" name="participant_t">
                                                <option value="">Select</option>
                                                <?php
                                                    $place = $place_arr[$event['event_location_id']];
                                                    if($place->red) echo "<option value=\"red\">red</option>";
                                                    if($place->green) echo "<option value=\"green\">green</option>";
                                                    if($place->white) echo "<option value=\"white\">white</option>";
                                                    if($place->blue) echo "<option value=\"blue\">blue</option>";
                                                    if($place->black) echo "<option value=\"black\">black</option>";
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="removeParticipantBtn" type="button" class="btn btn-danger"><div class="lds-dual-ring loadingIcon"></div>Update</button>
                            </div>
                        </div>
                    `;

            Swal.fire({
                html:html,
                width:640,
                showConfirmButton: false,
            })

            $(".modal-body input[name='participant_score']").val(score);
            $(".modal-body select[name='participant_t']").val(t);

            $("#removeParticipantBtn").click(function(){
                const newScore = $(".modal-body input[name='participant_score']").val();
                const newT = $(".modal-body select[name='participant_t']").val();


                let url = "/restAPI/eventController.php?action=updateScore&dataType=json";
                let options = {
                    method: "POST",
                    headers: {"Content-Type": "application/x-www-form-urlencoded"},
                    body: `participant_id=${participantId}&participant_score=${newScore}&participant_t=${newT}`,
                    credentials: 'same-origin',
                };

                fetch(url,options)
                    .then(response=>response.json())
                    .then(json=>{
                        if(json.code === 200){
                            const {result} = json;
                            currentBtnDOM.parents('tr').find('.participantT').text(newT);
                            currentBtnDOM.parents('tr').find('.participantScore').text(newScore);
                            Swal.close();
                        }else{
                            alert(json.message)
                        }
                    })
            })

            $('.close').click(function(){
                Swal.close();
            })

        })
    })
})
</script>


