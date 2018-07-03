class KakaoController < ApplicationController
  def keyboard
    @keyboard = {
      type: "buttons",
      buttons: ["로또", "주말에 뭐 먹지?", "태풍"]
    }
    
    render json: @keyboard
    
  end
  
  def message
    @user_msg = params[:content]
    
    @return_msg = {
      text: @user_msg
    }
    @return_keyboard = {
      type: "buttons",
      buttons: ["로또", "주말에 뭐 먹지?", "태풍"]
    }
    
    @result = {
      message:  @return_msg, #유저에게 보내는 메시지
      keyboard: @return_keyboard # 다음 키보드
    }
    #csrf-token : 외부서버에서 우리서버로 요청을 보내지 못하게 하기 위해서 (외부접근을 막음)
    render json: @result
  end
end
