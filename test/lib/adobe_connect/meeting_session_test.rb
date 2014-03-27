require File.expand_path('../../test_helper.rb', File.dirname(__FILE__))

class AdobeConnectMeetingSessionTest < AdobeConnectTestCase

  include AdobeConnectBaseTests

  AdobeConnect::Config.declare do
    username 'test@example.com'
    password 'pwd'
    domain   'http://example.com'
  end

  def test_find_by_meeting_should_return_sessions
    response = mock_ac_response(responses[:find_by_meeting_success])
    AdobeConnect::Service.any_instance.expects(:report_meeting_sessions).
      with(sco_id: '98765').
      returns(response)

    connect_sessions = AdobeConnect::MeetingSession.find_by_meeting('98765')
    assert_instance_of AdobeConnect::MeetingSession, connect_sessions.first
  end

  def test_initialize_takes_a_hash_with_appropriate_keys; end
  def test_save_persists_obj_to_connect_server; end
  def test_save_stores_the_obj_id_on_the_obj; end
  def test_save_returns_false_on_failure; end
  def test_save_stores_errors_on_failure; end
  def test_create_should_return_a_new_obj; end
  def test_should_update_obj; end
  def test_should_delete_obj; end
  def test_should_update_permissions_on_obj; end

  private

  def obj_attrs
    {
      date_created: nil,
      date_end: nil
    }
  end

  def responses
    load_responses([:find_by_meeting_success])
  end
end
