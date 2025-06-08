
function [Images]=Separation(Im)
global Images
Images{1}=Im(1:128 ,1:128) ;
Images{2}=Im(129:256 ,1:128) ;
Images{3}=Im(257:384 ,1:128) ;
Images{4}=Im(385:512 ,1:128) ;
Images{5}=Im(1:128 ,129:256) ;
Images{6}=Im(129:256 ,129:256) ;
Images{7}=Im(257:384 ,129:256) ;
Images{8}=Im(385:512 ,129:256) ;
Images{9}=Im(1:128 ,257:384) ;
Images{10}=Im(129:256 ,257:384) ;
Images{11}=Im(257:384 ,257:384) ;
Images{12}=Im(385:512 ,257:384) ;
Images{13}=Im(1:128 ,385:512) ;
Images{14}=Im(129:256 ,385:512) ;
Images{15}=Im(257:384 ,385:512) ;
Images{16}=Im(385:512 ,385:512) ;
end
