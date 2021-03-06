heat.ob <- function(n,beg = 1,end = 256)
{
    if(beg < 1 || end < 1 || beg > 256 || end > 256)
	stop("`beg' and `end' must be numbers in the interval [1,256]")

    M <- rbind(c(0, 0, 0),
	       c(35, 0, 0),
	       c(52, 0, 0),
	       c(60, 0, 0),
	       c(63, 1, 0),
	       c(64, 2, 0),
	       c(68, 5, 0),
	       c(69, 6, 0),
	       c(72, 8, 0),
	       c(74,10, 0),
	       c(77,12, 0),
	       c(78,14, 0),
	       c(81,16, 0),
	       c(83,17, 0),
	       c(85,19, 0),
	       c(86,20, 0),
	       c(89,22, 0),
	       c(91,24, 0),
	       c(92,25, 0),
	       c(94,26, 0),
	       c(95,28, 0),
	       c(98,30, 0),
	       c(100,31, 0),
	       c(102,33, 0),
	       c(103,34, 0),
	       c(105,35, 0),
	       c(106,36, 0),
	       c(108,38, 0),
	       c(109,39, 0),
	       c(111,40, 0),
	       c(112,42, 0),
	       c(114,43, 0),
	       c(115,44, 0),
	       c(117,45, 0),
	       c(119,47, 0),
	       c(119,47, 0),
	       c(120,48, 0),
	       c(122,49, 0),
	       c(123,51, 0),
	       c(125,52, 0),
	       c(125,52, 0),
	       c(126,53, 0),
	       c(128,54, 0),
	       c(129,56, 0),
	       c(129,56, 0),
	       c(131,57, 0),
	       c(132,58, 0),
	       c(134,59, 0),
	       c(134,59, 0),
	       c(136,61, 0),
	       c(137,62, 0),
	       c(137,62, 0),
	       c(139,63, 0),
	       c(139,63, 0),
	       c(140,65, 0),
	       c(142,66, 0),
	       c(142,66, 0),
	       c(143,67, 0),
	       c(143,67, 0),
	       c(145,68, 0),
	       c(145,68, 0),
	       c(146,70, 0),
	       c(146,70, 0),
	       c(148,71, 0),
	       c(148,71, 0),
	       c(149,72, 0),
	       c(149,72, 0),
	       c(151,73, 0),
	       c(151,73, 0),
	       c(153,75, 0),
	       c(153,75, 0),
	       c(154,76, 0),
	       c(154,76, 0),
	       c(154,76, 0),
	       c(156,77, 0),
	       c(156,77, 0),
	       c(157,79, 0),
	       c(157,79, 0),
	       c(159,80, 0),
	       c(159,80, 0),
	       c(159,80, 0),
	       c(160,81, 0),
	       c(160,81, 0),
	       c(162,82, 0),
	       c(162,82, 0),
	       c(163,84, 0),
	       c(163,84, 0),
	       c(165,85, 0),
	       c(165,85, 0),
	       c(166,86, 0),
	       c(166,86, 0),
	       c(166,86, 0),
	       c(168,87, 0),
	       c(168,87, 0),
	       c(170,89, 0),
	       c(170,89, 0),
	       c(171,90, 0),
	       c(171,90, 0),
	       c(173,91, 0),
	       c(173,91, 0),
	       c(174,93, 0),
	       c(174,93, 0),
	       c(176,94, 0),
	       c(176,94, 0),
	       c(177,95, 0),
	       c(177,95, 0),
	       c(179,96, 0),
	       c(179,96, 0),
	       c(180,98, 0),
	       c(182,99, 0),
	       c(182,99, 0),
	       c(183,100, 0),
	       c(183,100, 0),
	       c(185,102, 0),
	       c(185,102, 0),
	       c(187,103, 0),
	       c(187,103, 0),
	       c(188,104, 0),
	       c(188,104, 0),
	       c(190,105, 0),
	       c(191,107, 0),
	       c(191,107, 0),
	       c(193,108, 0),
	       c(193,108, 0),
	       c(194,109, 0),
	       c(196,110, 0),
	       c(196,110, 0),
	       c(197,112, 0),
	       c(197,112, 0),
	       c(199,113, 0),
	       c(200,114, 0),
	       c(200,114, 0),
	       c(202,116, 0),
	       c(202,116, 0),
	       c(204,117, 0),
	       c(205,118, 0),
	       c(205,118, 0),
	       c(207,119, 0),
	       c(208,121, 0),
	       c(208,121, 0),
	       c(210,122, 0),
	       c(211,123, 0),
	       c(211,123, 0),
	       c(213,124, 0),
	       c(214,126, 0),
	       c(214,126, 0),
	       c(216,127, 0),
	       c(217,128, 0),
	       c(217,128, 0),
	       c(219,130, 0),
	       c(221,131, 0),
	       c(221,131, 0),
	       c(222,132, 0),
	       c(224,133, 0),
	       c(224,133, 0),
	       c(225,135, 0),
	       c(227,136, 0),
	       c(227,136, 0),
	       c(228,137, 0),
	       c(230,138, 0),
	       c(230,138, 0),
	       c(231,140, 0),
	       c(233,141, 0),
	       c(233,141, 0),
	       c(234,142, 0),
	       c(236,144, 0),
	       c(236,144, 0),
	       c(238,145, 0),
	       c(239,146, 0),
	       c(241,147, 0),
	       c(241,147, 0),
	       c(242,149, 0),
	       c(244,150, 0),
	       c(244,150, 0),
	       c(245,151, 0),
	       c(247,153, 0),
	       c(247,153, 0),
	       c(248,154, 0),
	       c(250,155, 0),
	       c(251,156, 0),
	       c(251,156, 0),
	       c(253,158, 0),
	       c(255,159, 0),
	       c(255,159, 0),
	       c(255,160, 0),
	       c(255,161, 0),
	       c(255,163, 0),
	       c(255,163, 0),
	       c(255,164, 0),
	       c(255,165, 0),
	       c(255,167, 0),
	       c(255,167, 0),
	       c(255,168, 0),
	       c(255,169, 0),
	       c(255,169, 0),
	       c(255,170, 0),
	       c(255,172, 0),
	       c(255,173, 0),
	       c(255,173, 0),
	       c(255,174, 0),
	       c(255,175, 0),
	       c(255,177, 0),
	       c(255,178, 0),
	       c(255,179, 0),
	       c(255,181, 0),
	       c(255,181, 0),
	       c(255,182, 0),
	       c(255,183, 0),
	       c(255,184, 0),
	       c(255,187, 7),
	       c(255,188,10),
	       c(255,189,14),
	       c(255,191,18),
	       c(255,192,21),
	       c(255,193,25),
	       c(255,195,29),
	       c(255,197,36),
	       c(255,198,40),
	       c(255,200,43),
	       c(255,202,51),
	       c(255,204,54),
	       c(255,206,61),
	       c(255,207,65),
	       c(255,210,72),
	       c(255,211,76),
	       c(255,214,83),
	       c(255,216,91),
	       c(255,219,98),
	       c(255,221,105),
	       c(255,223,109),
	       c(255,225,116),
	       c(255,228,123),
	       c(255,232,134),
	       c(255,234,142),
	       c(255,237,149),
	       c(255,239,156),
	       c(255,240,160),
	       c(255,243,167),
	       c(255,246,174),
	       c(255,248,182),
	       c(255,249,185),
	       c(255,252,193),
	       c(255,253,196),
	       c(255,255,204),
	       c(255,255,207),
	       c(255,255,211),
	       c(255,255,218),
	       c(255,255,222),
	       c(255,255,225),
	       c(255,255,229),
	       c(255,255,233),
	       c(255,255,236),
	       c(255,255,240),
	       c(255,255,244),
	       c(255,255,247),
	       c(255,255,255))[ round(seq(beg,end,length = n)), ]

    rgb(M[,1]/255,
	M[,2]/255,
	M[,3]/255)

}
