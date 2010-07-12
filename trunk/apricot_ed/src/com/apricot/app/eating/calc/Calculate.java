/**
 * 
 */
package com.apricot.app.eating.calc;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import com.apricot.app.eating.calc.vo.OrderGroup;
import com.apricot.app.eating.calc.vo.Rule;
import com.apricot.app.eating.calc.vo.RuleValue;
/**
 * @author Administrator
 */
public class Calculate {
	/**
	 * 
	 */
	public Calculate() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * ͨ������Ͷ���Ⱥ�����˲�������������ѹ���
	 * 
	 * @param rules
	 * @param og
	 * @return
	 */
	public List filterRules(List rules, OrderGroup og) {
		CalculateRule c = new CalculateRule();
		for (int i = rules.size() - 1; i >= 0; i--) {
			Rule r = (Rule) rules.get(i);
			if (!c.check(r, og)){
				rules.remove(i);
			}
			else if (!r.existScope() && !r.isVip())
				rules.remove(i);
			
			c.filter(r, og);
		}
		return rules;
	}

	/**
	 * ���з��ü��㣬���ó����õȵ���Ϣ
	 * 
	 * @param rules
	 * @param og
	 * @return
	 */
	public List calculate(List rules, OrderGroup og) {
		// System.out.println(2);
		CalculateRule c = new CalculateRule();

		// ������������ۿ۷�Χ�Ĺ���
		for (int i = rules.size() - 1; i >= 0; i--) {
			Rule r = (Rule) rules.get(i);
			if (!r.existScope() && !r.isVip())
				rules.remove(i);
		}
		// �̶��������
		for (Iterator rs = rules.iterator(); rs.hasNext();) {
			Rule r = (Rule) rs.next();
			// Collection details = og.getOrderDetailsBy(r);
			// for (Iterator rsCon = r.conditions(); rsCon.hasNext();) {
			// RuleCondition con = (RuleCondition)rsCon.next();
			// System.out.println(con.getCondValue());
			// }
			
			for (Iterator vs = r.values(); vs.hasNext();) {
				RuleValue v = (RuleValue) vs.next();
				if (!"0".equals(v.getPriceUnit()))
					continue;
				
				c.dealPresent(v, r, og);
				// c.dealPresent(v, og);
			}
		}
		if (og.isUsePoint()) {// ֻ�е�ʹ�û��ֵ�ʱ��ſ���ʹ��
			// �����ֵ���ֵֿ��ֽ�
			
			for (Iterator rs = rules.iterator(); rs.hasNext();) {
				Rule r = (Rule) rs.next();
				
				for (Iterator vs = r.values(); vs.hasNext();) {
					RuleValue v = (RuleValue) vs.next();
					
					if (!"4".equals(v.getPriceUnit()))
						continue;
					c.dealPointDeduction(v, og);
					// pointCountFlag = false;
				}
			}
		}
		// �����ۿ�
		for (Iterator rs = rules.iterator(); rs.hasNext();) {
			Rule r = (Rule) rs.next();
			Collection details = og.getOrderDetailsBy(r);
			for (Iterator vs = r.values(); vs.hasNext();) {
				RuleValue v = (RuleValue) vs.next();
				if (!"1".equals(v.getPriceUnit()))
					continue;
				
				c.dealDiscount(v, details,og);
			}
			
		}
		//og.setPayTotal(og.getPayTotal() * og.getVipDiscount() / 100F);


		// �������͹̶�����
		for (Iterator rs = rules.iterator();  rs.hasNext();) {
			Rule r = (Rule) rs.next();
			for (Iterator vs = r.values(); vs.hasNext();) {
				RuleValue v = (RuleValue) vs.next();
				if (!"2".equals(v.getPriceUnit()))
					continue;
				//System.out.println(r.getName()+"="+v.getPriceUnit()+"="+v.getPriceValue());
				c.dealPresentPoint(v, og);
		
				//break;
			}
		}
		// �����ֵ�ֽ�������
		for (Iterator rs = rules.iterator();  rs.hasNext();) {
			Rule r = (Rule) rs.next();
			for (Iterator vs = r.values(); vs.hasNext();) {
				RuleValue v = (RuleValue) vs.next();
				if (!"3".equals(v.getPriceUnit()))
					continue;
				
				c.dealPointCount(v, og);
		
				//break;
			}
		}
		return null;
	}

}
