require 'test_helper'

class LegalDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @legal_document = legal_documents(:one)
  end

  test "should get index" do
    get legal_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_legal_document_url
    assert_response :success
  end

  test "should create legal_document" do
    assert_difference('LegalDocument.count') do
      post legal_documents_url, params: { legal_document: { admin_user: @legal_document.admin_user, clinic_history_id: @legal_document.clinic_history_id, description: @legal_document.description, name: @legal_document.name, patient_id: @legal_document.patient_id, type_document: @legal_document.type_document, user_id: @legal_document.user_id } }
    end

    assert_redirected_to legal_document_url(LegalDocument.last)
  end

  test "should show legal_document" do
    get legal_document_url(@legal_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_legal_document_url(@legal_document)
    assert_response :success
  end

  test "should update legal_document" do
    patch legal_document_url(@legal_document), params: { legal_document: { admin_user: @legal_document.admin_user, clinic_history_id: @legal_document.clinic_history_id, description: @legal_document.description, name: @legal_document.name, patient_id: @legal_document.patient_id, type_document: @legal_document.type_document, user_id: @legal_document.user_id } }
    assert_redirected_to legal_document_url(@legal_document)
  end

  test "should destroy legal_document" do
    assert_difference('LegalDocument.count', -1) do
      delete legal_document_url(@legal_document)
    end

    assert_redirected_to legal_documents_url
  end
end
