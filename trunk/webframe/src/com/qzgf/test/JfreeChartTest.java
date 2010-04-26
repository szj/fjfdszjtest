package com.qzgf.test;

import java.awt.Font;
import java.io.IOException;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;

public class JfreeChartTest {
	public static JFreeChart createChart() throws IOException {   
		// ���ݼ�   
        DefaultPieDataset dpd = new DefaultPieDataset();   
        dpd.setValue("�ڷ�", 40);   
        dpd.setValue("��ͨ", 0);   
        dpd.setValue("����", 20);   
        dpd.setValue("Ȫ��", 40);   
        // ����PieChart����   
        JFreeChart chart = ChartFactory.createPieChart("Ȫ�������ֹ�˾��Ա�ֲ�ͼ", dpd,   
                true, true, false);   
        utils.setFont(chart);   
        return chart;  
    }    
}

class utils {   
    public static void setFont(JFreeChart chart) {   
        Font font = new Font("����", Font.ITALIC, 12);   
        PiePlot plot = (PiePlot) chart.getPlot();   
        chart.getTitle().setFont(font);   
        plot.setLabelFont(font);   
        chart.getLegend().setItemFont(font);   
    }   
}  

