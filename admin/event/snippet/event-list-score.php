<?php
try {
    global $userModel;
    global $place_arr;
    $eventModel = new \model\EventModel();
    $eventId = (int) $_GET['eventId'];
    if ($eventId) {
        //修改
        $userModel->isCurrentUserHasAuthority('EVENT', 'UPDATE') or Helper::throwException(null, 403);
        $event = $eventModel->getEvents([$eventId])[0] or Helper::throwException("event not exist");
        $participants = $eventModel->getParticipants($eventId);
        $place = $place_arr[$event['event_location_id']];
    }else{
        Helper::throwException("Event Id required");
    }
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
        <?php Helper::echoBackBtn(2);?>
    </label>
</div>
<!--header end-->
<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <div class="row m-b-20">
                <div class="col-sm-12">
                    <h3 class="box-title m-b-0"><?=$event['event_title']?></h3>
                </div>
            </div>
                <div class="table-responsive">
                    <table class="table orderTable color-table dark-table table-hover">
                        <thead>
                        <tr>
                            <th width="30" class="p-l-20">#</th>
                            <th>AVATAR</th>
                            <th>Name</th>
                            <th>SEAT</th>
                            <th>T TYPE (S/R/P)</th>
                            <th><a <?=$eventModel->getScoreListOrderUrl($eventId,'participant_score')?>>GROSS SCORE</a></th>
                            <th><a <?=$eventModel->getScoreListOrderUrl($eventId,'participant_handicap_differential')?>>DIFFERENTIAL</a></th>
                            <th><a <?=$eventModel->getScoreListOrderUrl($eventId,'participant_handicap_index')?>>INDEX</a></th>
                            <th><a <?=$eventModel->getScoreListOrderUrl($eventId,'participant_net_score')?>>NET SCORE</a></th>
                            <th>DATE</th>
                            <th width="70"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        $index = 1;
                        foreach ($participants as $row) {
                            ?>
                            <tr>
                                <td class="p-l-20"><?=$index++?></td>
                                <td><div class="avatar avatar-40" style="background-image: url('<?=$row['user_avatar']?>')"></td>
                                <td><?=$row['user_first_name'] ?> <?=$row['user_last_name'] ?></td>
                                <td><?=$row['participant_index']+1?></td>
                                <td><span class="participantT"><?=$row['participant_t']?></span> (<span class="tR"><?=$place->{$row['participant_t']}->rating ?></span>/<span class="tS"><?=$place->{$row['participant_t']}->slope?></span>/<span class="tP"><?=$place->{$row['participant_t']}->par?></span>)</td>
                                <td><span class="participantScore"><?=$row['participant_score'] ?></span></td>
                                <td><span class="handicapDifferential"><?=$row['participant_handicap_differential'] ?></span></td>
                                <td><a href="/admin/event/index.php?s=event-list-participant-history&participantId=<?=$row['participant_id'] ?>"><span class="participantIndex"><?=$row['participant_handicap_index'] ?></span></a></td>
                                <td><span class="participantNetScore"><?=$row['participant_net_score'] ?></span></td>
                                <td><span class="participantDate"><?=$row['participant_date'] ?></span></td>
                                <td><div class="editScoreBtn" style="cursor:pointer;width: 40px; text-align: center" data-participant-id="<?=$row['participant_id']?>"><i class="ti-marker-alt"></i></div></td>
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
                                        <label class="col-sm-3 control-label">Gross Score</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="participant_score" value="" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">T Type</label>
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
                            currentBtnDOM.parents('tr').find('.participantT').text(result.participant_t);
                            currentBtnDOM.parents('tr').find('.participantScore').text(result.participant_score);
                            currentBtnDOM.parents('tr').find('.handicapDifferential').text(result.participant_handicap_differential);
                            currentBtnDOM.parents('tr').find('.participantIndex').text(result.participant_handicap_index);
                            currentBtnDOM.parents('tr').find('.participantNetScore').text(result.participant_net_score);
                            currentBtnDOM.parents('tr').find('.participantDate').text(result.participant_date);
                            currentBtnDOM.parents('tr').find('.tR').text(result.rating);
                            currentBtnDOM.parents('tr').find('.tS').text(result.slope);
                            currentBtnDOM.parents('tr').find('.tP').text(result.par);
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


