/*
 * The Apache Software License, Version 1.1
 *
 * Copyright (c) 2001 The Apache Software Foundation.  All rights
 * reserved.
 */

package com.womobile.mp.activity;

import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


import android.app.Activity;
import android.app.AlertDialog;
import android.content.ContentValues;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.womobile.mp.entities.Feedback;
import com.womobile.mp.R;
import com.womobile.mp.FieldSupport;
/**
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */


	
	
public class EditFeedbackActivity extends Activity {
	private EditText IDEdt;
	private EditText TITLEEdt;
	private EditText DETAILEdt;
	private EditText ADJUNCTEdt;
	private EditText ATTITUDEEdt;
	private EditText DEFINEEdt;
	private EditText FLOWER_STATEEdt;
	private EditText PROCESS_CODEEdt;
	private EditText AUDITING_CODEEdt;
	private EditText BILL_STATEEdt;
	private EditText CREATE_CODEEdt;
	private EditText CREATE_DATEEdt;
	private EditText EDITOR_CODEEdt;
	private EditText EDITOR_DATEEdt;
	private EditText BILLIDEdt;
	private int Feedback_id;

	private Button okBtn;
	private Button cancelBtn;	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.feedback);
		initView();
		fillBrandSpinner();
		fillAgencyText();
		setTextFileds(getIntent());
		setListeners();
	}
	
	private void initView() {
		IDEdt=(EditText)this.findViewById(R.id.feedback_ID);
		TITLEEdt=(EditText)this.findViewById(R.id.feedback_TITLE);
		DETAILEdt=(EditText)this.findViewById(R.id.feedback_DETAIL);
		ADJUNCTEdt=(EditText)this.findViewById(R.id.feedback_ADJUNCT);
		ATTITUDEEdt=(EditText)this.findViewById(R.id.feedback_ATTITUDE);
		DEFINEEdt=(EditText)this.findViewById(R.id.feedback_DEFINE);
		FLOWER_STATEEdt=(EditText)this.findViewById(R.id.feedback_FLOWER_STATE);
		PROCESS_CODEEdt=(EditText)this.findViewById(R.id.feedback_PROCESS_CODE);
		AUDITING_CODEEdt=(EditText)this.findViewById(R.id.feedback_AUDITING_CODE);
		BILL_STATEEdt=(EditText)this.findViewById(R.id.feedback_BILL_STATE);
		CREATE_CODEEdt=(EditText)this.findViewById(R.id.feedback_CREATE_CODE);
		CREATE_DATEEdt=(EditText)this.findViewById(R.id.feedback_CREATE_DATE);
		EDITOR_CODEEdt=(EditText)this.findViewById(R.id.feedback_EDITOR_CODE);
		EDITOR_DATEEdt=(EditText)this.findViewById(R.id.feedback_EDITOR_DATE);
		BILLIDEdt=(EditText)this.findViewById(R.id.feedback_BILLID);
		okBtn = (Button) this.findViewById(R.id.btnfeedbacksumbit);
		cancelBtn = (Button) this.findViewById(R.id.btnfeedbackcancel);
	}
	
	private void fillBrandSpinner() {
	}
	
	private void fillAgencyText() {
	}
	
	private void setListeners() {
	    okBtn.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				if (validation()) {
					int number = 0;
					number = updateFeedback(Feedback.CONTENT_URI
							,Feedback.KEY_ID
							,Feedback.KEY_TITLE
							,Feedback.KEY_DETAIL
							,Feedback.KEY_ADJUNCT
							,Feedback.KEY_ATTITUDE
							,Feedback.KEY_DEFINE
							,Feedback.KEY_FLOWER_STATE
							,Feedback.KEY_PROCESS_CODE
							,Feedback.KEY_AUDITING_CODE
							,Feedback.KEY_BILL_STATE
							,Feedback.KEY_CREATE_CODE
							,Feedback.KEY_CREATE_DATE
							,Feedback.KEY_EDITOR_CODE
							,Feedback.KEY_EDITOR_DATE
							,Feedback.KEY_BILLID
					);
					if (number!=0) {
						openSuccessDialog();
					}else
						Toast.makeText(EditFeedbackActivity.this, "修改失败，请检查数据",
								Toast.LENGTH_SHORT).show();
				}
			}
		});
		cancelBtn.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				finish();
			}
		});
		
	}
	
	
	private int updateFeedback(Uri uriType
				,String ID
				,String TITLE
				,String DETAIL
				,String ADJUNCT
				,String ATTITUDE
				,String DEFINE
				,String FLOWER_STATE
				,String PROCESS_CODE
				,String AUDITING_CODE
				,String BILL_STATE
				,String CREATE_CODE
				,String CREATE_DATE
				,String EDITOR_CODE
				,String EDITOR_DATE
				,String BILLID
			) {
		ContentValues values = new ContentValues();
		
			values.put(ID, IDEdt.getText().toString());	
			values.put(TITLE, TITLEEdt.getText().toString());	
			values.put(DETAIL, DETAILEdt.getText().toString());	
			values.put(ADJUNCT, ADJUNCTEdt.getText().toString());	
			values.put(ATTITUDE, ATTITUDEEdt.getText().toString());	
			values.put(DEFINE, DEFINEEdt.getText().toString());	
			values.put(FLOWER_STATE, FLOWER_STATEEdt.getText().toString());	
			values.put(PROCESS_CODE, PROCESS_CODEEdt.getText().toString());	
			values.put(AUDITING_CODE, AUDITING_CODEEdt.getText().toString());	
			values.put(BILL_STATE, BILL_STATEEdt.getText().toString());	
			values.put(CREATE_CODE, CREATE_CODEEdt.getText().toString());	
			values.put(CREATE_DATE, CREATE_DATEEdt.getText().toString());	
			values.put(EDITOR_CODE, EDITOR_CODEEdt.getText().toString());	
			values.put(EDITOR_DATE, EDITOR_DATEEdt.getText().toString());	
			values.put(BILLID, BILLIDEdt.getText().toString());	
		
		
		int number = getContentResolver().update(uriType, values
				,FieldSupport.KEY_ID +"="+ Feedback_id, null);

		return number;
	}

	private void setTextFileds(Intent intent) {
		HashMap<String, String> map = (HashMap<String, String>) intent
				.getExtras().get("dataMap");
		HashMap<Integer, HashMap<String, String>> detailMap = (HashMap<Integer, HashMap<String, String>>) intent
				.getExtras().get("detailMap");
		Feedback_id = Integer.parseInt(map.get(FieldSupport.KEY_ID));
		
		         IDEdt.setText(map.get(Feedback.KEY_ID));
		         TITLEEdt.setText(map.get(Feedback.KEY_TITLE));
		         DETAILEdt.setText(map.get(Feedback.KEY_DETAIL));
		         ADJUNCTEdt.setText(map.get(Feedback.KEY_ADJUNCT));
		         ATTITUDEEdt.setText(map.get(Feedback.KEY_ATTITUDE));
		         DEFINEEdt.setText(map.get(Feedback.KEY_DEFINE));
		         FLOWER_STATEEdt.setText(map.get(Feedback.KEY_FLOWER_STATE));
		         PROCESS_CODEEdt.setText(map.get(Feedback.KEY_PROCESS_CODE));
		         AUDITING_CODEEdt.setText(map.get(Feedback.KEY_AUDITING_CODE));
		         BILL_STATEEdt.setText(map.get(Feedback.KEY_BILL_STATE));
		         CREATE_CODEEdt.setText(map.get(Feedback.KEY_CREATE_CODE));
		         CREATE_DATEEdt.setText(map.get(Feedback.KEY_CREATE_DATE));
		         EDITOR_CODEEdt.setText(map.get(Feedback.KEY_EDITOR_CODE));
		         EDITOR_DATEEdt.setText(map.get(Feedback.KEY_EDITOR_DATE));
		         BILLIDEdt.setText(map.get(Feedback.KEY_BILLID));
		
	}
	
	
	private boolean validation() {
		String tag = "";
		/*
		if (!isInteger(countEdt.getText().toString()))
			tag += "请在商品数量中输入数字\n";
		if (!isValidDate())
			tag += "日期不能小于今天";
		*/
		if (tag.equals(""))
			return true;
		else {
			Toast.makeText(EditFeedbackActivity.this, tag, Toast.LENGTH_LONG)
					.show();
			return false;
		}
	}

		
	private void openSuccessDialog() {
		new AlertDialog.Builder(EditFeedbackActivity.this).setTitle("").setMessage(
				"修改成功").setPositiveButton("确定",
				new DialogInterface.OnClickListener() {

					public void onClick(DialogInterface dialog, int which) {
						dialog.dismiss();
						finish();
					}
				}).show();
	}
	
	
	private boolean isInteger(String number) {
		Pattern pattern = Pattern.compile("^-?\\d+$");
		Matcher match = pattern.matcher(number);
		return match.matches();
	}
}
