package com.qzgf.application.systemManage.log.dto;

public class OperateLog {
	private String optSeq;		//������־��
	private String staffId;		//��ԱID
	private String serviceName;	//ҵ���������		�磺�һ����û���
	private String optTime;		//����ʱ��
	private String optResult;	//�������	�����귵�صĳɹ���Ϣ��ʧ����Ϣ
	private String optMemo;		//˵��
	private String termType = "";	//�ն�����	��IE��ǰ�û�
	private String optTerm;		//��¼�ն˺�	IP ,POS����
	private String begDate;		//���ڲ�ѯʱʹ��
	private String endDate;
	private String userno;		//��Ա����
	private Integer cityId;
	private Integer areaId;//����
	
	public String getBegDate() {
		return begDate;
	}



	public void setBegDate(String begDate) {
		this.begDate = begDate;
	}



	public Integer getCityId() {
		return cityId;
	}



	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}



	public String getEndDate() {
		return endDate;
	}



	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}



	public String getOptMemo() {
		return optMemo;
	}



	public void setOptMemo(String optMemo) {
		this.optMemo = optMemo;
	}



	public String getOptResult() {
		return optResult;
	}



	public void setOptResult(String optResult) {
		this.optResult = optResult;
	}



	public String getOptSeq() {
		return optSeq;
	}



	public void setOptSeq(String optSeq) {
		this.optSeq = optSeq;
	}



	public String getOptTerm() {
		return optTerm;
	}



	public void setOptTerm(String optTerm) {
		this.optTerm = optTerm;
	}



	public String getOptTime() {
		return optTime;
	}



	public void setOptTime(String optTime) {
		this.optTime = optTime;
	}



	public String getServiceName() {
		return serviceName;
	}



	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}



	public String getStaffId() {
		return staffId;
	}



	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}



	public String getTermType() {
		return termType;
	}



	public void setTermType(String termType) {
		this.termType = termType;
	}



	public String getUserno() {
		return userno;
	}



	public void setUserno(String userno) {
		this.userno = userno;
	}

	public Integer getAreaId() {
		return areaId;
	}



	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}
}
