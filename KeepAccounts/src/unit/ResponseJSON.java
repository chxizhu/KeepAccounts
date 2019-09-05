package unit;

/**
 * һ�����ڴ��?����Ϣ��json���Ͷ���
 * @author zhang jin sheng
 *
 */
public class ResponseJSON {

	public static final int FLAG_SUCC = 10001;  //����ɹ�
    public static final int FLAG_FAIL = 10002;  //����ʧ��
    public static final int FLAG_UNKNOWN_ERORR = 10003;  //δ֪���쳣�����
    
    public int code; //������״̬��
    public String msg;  //���������Ϣ
    public String resultString; //���?�ؽ��������һ����ת��Ϊjson��ʽ���ַ�
    public Object resultoObject;
  
    
    public ResponseJSON(){
    	this.code = FLAG_FAIL;
    	this.msg = null;
    	this.resultString = null;
    	this.resultoObject = null;
    	
    }
}
