class StateController << ApplicationController
  @matched_state = []
  def filter
    if (params[:substring] != nil) then
      @matched_state << params[:string]
    end
  end
end
