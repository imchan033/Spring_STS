package survey;

import java.util.List;

public class AnsweredData {
  private List<String> responses;
  private Respondant res;

  public List<String> getResponses() {
    return responses;
  }

  public void setResponses(List<String> responses) {
    this.responses = responses;
  }

  public Respondant getRes() {
    return res;
  }

  public void setRes(Respondant res) {
    this.res = res;
  }
}
