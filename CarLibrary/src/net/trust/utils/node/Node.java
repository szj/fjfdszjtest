package net.trust.utils.node;

/**
 * @author chenf
 * 2006��4��15��
 * һ���ڵ���
 * **/
public class Node {
	private String id ;//�ڵ��Ψһ��
	private String title;//�ڵ�����
	private String superId;//���׽ڵ�
	private int checked = 0 ;//�Ƿ�ѡ�иýڵ�
	private String target ;//��������Ŀ�괰������
	private String href; //�ڵ�����
	private String nodeXMLSrc;//ͨ��URL��̬�ڼ����ӽڵ�����,���ó���̬����xml����
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSuperId() {
		return superId;
	}
	public void setSuperId(String superId) {
		this.superId = superId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public String getNodeXMLSrc() {
		return nodeXMLSrc;
	}
	public void setNodeXMLSrc(String nodeXMLSrc) {
		this.nodeXMLSrc = nodeXMLSrc;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
}
