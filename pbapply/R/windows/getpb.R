getpb <-
function(pb)
{
    if (dopb()) {
        progress.bar <- getOption("pboptions")$type
        rval <- switch(progress.bar,
            timer = getTxtProgressBar(pb),
            txt = getTxtProgressBar(pb),
            win = getWinProgressBar(pb),
            tk = tcltk::getTkProgressBar(pb))
    } else {
        rval <- NULL
    }
    rval
}

