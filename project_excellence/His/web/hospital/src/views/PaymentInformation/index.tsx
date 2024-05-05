import { Button, Card, Popconfirm, Space, Table, Tag, message } from "antd";
import { QuestionCircleOutlined, SearchOutlined } from "@ant-design/icons";
import { useEffect, useState } from "react";
import SearchForm from "../../components/SearchForm";
import { AxiosRequestConfig } from "axios";
import { queryPatientPayPageAPI, alipayAPI } from "../../apis/api";
import style from './index.module.scss'
import { ColumnsType } from "antd/es/table";
// 引入cookie
import cookie from 'react-cookies'
import { url } from "inspector";

type RegisterDataType = {
  prescriptionId: number;
  departmentName: string;
  doctorName: string;
  drugsPrice: number;
  paymentStatus: number;
  prescriptionTime: string;
}

export default function View() {
  /* 查找列表开始 */

  // 搜索框
  const [open, setOpen] = useState<boolean | null>(null);
  // 查到的数据
  const [tableList, setTableList] = useState<QueryAPIRes>();
  // 加载状态
  const [loading, setLoading] = useState(true);

  // 字段数组
  let options: Array<optionsType> = [
    { value: 'prescription_time', label: '开具时间' },
  ]

  // 拿用户信息
  let userData = cookie.load("userData")

  // 查找表单
  let searchForm = {
    key: options[0].value,
    value: "",
    flag: userData.patientId,
    pageNum: 1,
    pageSize: 10
  }

  // 查找方法
  const queryFunc = (optionData: optionsDataType = { key: options[0].value, value: "" }) => {
    searchForm.key = optionData.key
    searchForm.value = optionData.value
    queryAPI(searchForm as AxiosRequestConfig<QueryAPIReq>)
  }

  // 查找接口
  const queryAPI = async (searchForm: AxiosRequestConfig<QueryAPIReq>) => {
    // 发起查找请求
    const tableList = await queryPatientPayPageAPI(searchForm)
    setTableList(tableList)
    setLoading(false)
  };

  // 初始查找
  useEffect(() => {
    queryAPI(searchForm as AxiosRequestConfig<QueryAPIReq>)
  }, [])

  /* 查找列表结束 */

  /* 表格开始 */
interface AlipayType{
  subject:Number,
  traceNo:Number,
  totalAmount:Number
}
  // 支付
  const payBtn = async (alipayData:AlipayType) => {
    // const updateFlag = await alipayAPI(alipayData as AxiosRequestConfig<QueryAPIReq>)
    // updateFlag.code === 0 ? message.success(updateFlag.msg) : message?.success(updateFlag.msg);
    window.open("http://localhost:8080/alipay/pay?subject="+alipayData.subject+"&traceNo="+alipayData.traceNo+"&totalAmount="+alipayData.totalAmount )
    message.success("支付宝请求成功")
    queryFunc()
  }

  // 表头
  const columns: ColumnsType<RegisterDataType> = [
    {
      title: '处方单号',
      dataIndex: 'prescriptionId',
      align: 'center',
    },
    {
      title: '科室',
      dataIndex: 'departmentName',
      align: 'center',
    },
    {
      title: '医生姓名',
      dataIndex: 'doctorName',
      align: 'center',
    },
    {
      title: '药物价格（元）',
      dataIndex: 'drugsPrice',
      align: 'center',
    },
    {
      title: '处方开具时间',
      dataIndex: 'prescriptionTime',
      align: 'center',
    },
    {
      title: '缴费状态',
      dataIndex: 'paymentStatus',
      align: 'center',
      render: (_, record) => {
        return (
          <Tag color={record.paymentStatus == 1 ? "success" : "warning"}>{record.paymentStatus == 1 ? '已缴费' : '未缴费'}</Tag>
        )
      }
    },
    {
      title: '操作',
      align: 'center',
      render: (_, record) => {
        const payData = {
          subject: userData.patientId,
          traceNo:record.prescriptionId,
          totalAmount:record.drugsPrice
        }
        return (
          <Popconfirm
            placement="bottomRight"
            title={'确认支付'}
            description={'将跳转到支付宝完成支付！'}
            icon={<QuestionCircleOutlined style={{ color: 'red' }} />}
            okText="确认"
            cancelText="取消"
            onConfirm={() => payBtn(payData)}
            disabled={record.paymentStatus==1}
          >
            <Button size='small' type="link" disabled={record.paymentStatus==1}>缴费</Button>
          </Popconfirm >
        )
      },
    },
  ];

  // 分页
  const paginationProps = {
    current: tableList?.pageNum, //当前页码
    pageSize: tableList?.pageSize, // 每页数据条数
    total: tableList?.total, // 总条数
    showTotal: () => (
      <span>共 {tableList?.total} 条</span>
    ),
    onChange: (page: number) => handlePageChange(page), //改变页码的函数
    showQuickJumper: true,
  }
  const handlePageChange = (page: number) => {
    searchForm.pageNum = page
    queryAPI(searchForm as AxiosRequestConfig<QueryAPIReq>);
  }

  // 顶部按钮
  const topBtn = <Space>
    <Button type="primary" shape="circle" icon={<SearchOutlined />} onClick={() => open === null ? setOpen(true) : setOpen(!open)} />
  </Space>
  /* 表格结束 */


  return (
    <Card className={style.allPage} size='small' title="缴费信息" extra={topBtn} bordered={false} style={{ width: '100%', minHeight: 'calc(100vh - 80px)' }}>
      {/* 搜索组件 */}
      <SearchForm options={options} queryFunc={queryFunc} queryAPI={queryAPI} open={open} />
      <Table
        columns={columns}
        dataSource={tableList?.data}
        rowKey='prescriptionId'
        size='middle' bordered
        loading={loading}
        pagination={paginationProps}
        scroll={{ x: 1250, }}
      />
    </Card>
  )
}
