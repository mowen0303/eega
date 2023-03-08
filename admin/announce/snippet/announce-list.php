<?php
try {
    global $userModel;
    $announceModel = new \model\AnnounceModel();
    $annanceArr = $announceModel->getAnnounces([0]);
} catch (Exception $e) {
    Helper::echoJson($e->getCode(),$e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">Event</h4>
    </div>
    <label class="col-sm-8 control-label">
        <?php Helper::echoBackBtn(1);?>
        <a href="/admin/event/index.php?s=event-list-form" class="btn btn-danger pull-right"><i class="fas fa-plus-circle"></i>  Add Event</a>
    </label>
</div>

<!--header end-->

<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <div class="row m-b-20">
                <div class="col-sm-12">
                    <h3 class="box-title m-b-0">Announce List</h3>
                </div>
            </div>
                <div class="table-responsive">
                    <table class="table orderTable color-table dark-table table-hover">
                        <thead>
                        <tr>
                            <th>Announce</th>
                            <th width="140"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach ($annanceArr as $row) {
                        ?>
                            <tr>
                                <td><?=$row['announce_title']?></td>
                                <td>
                                    <a href="/admin/announce/index.php?s=announce-form&announceId=<?=$row['announce_id']?>" class="text-inverse p-r-10" data-toggle="tooltip" title="" data-original-title="Edit"><i class="ti-marker-alt"></i></a>
                                </td>
                            </tr>
                            <?php
                        }
                        ?>
                        </tbody>
                    </table>
                </div>
        </div>
    </div>
</div>