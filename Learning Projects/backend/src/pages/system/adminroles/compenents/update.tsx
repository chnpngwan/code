import React, { useState, useEffect } from "react";
import {
  Drawer,
  TreeSelect,
  Space,
  Button,
  Form,
  Input,
  message,
  Spin,
} from "antd";
import styles from "./update.module.less";
import { adminRole } from "../../../../api/index";

interface PropInterface {
  id: any;
  open: boolean;
  onCancel: () => void;
}

interface Option {
  value: string | number;
  title: string;
  children?: Option[];
}

export const SystemAdminrolesUpdate: React.FC<PropInterface> = ({
  id,
  open,
  onCancel,
}) => {
  const [form] = Form.useForm();
  const [init, setInit] = useState(true);
  const [loading, setLoading] = useState(false);
  const [permissions, setPermissions] = useState<Option[]>([]);
  const [actions, setActions] = useState<Option[]>([]);

  useEffect(() => {
    if (open) {
      getParams();
    }
  }, [open]);

  useEffect(() => {
    setInit(true);
    if (id === undefined) {
      return;
    }
    if (open) {
      getDetail();
    }
  }, [id, open]);

  const getParams = () => {
    adminRole.createAdminRole().then((res: any) => {
      const arr: Option[] = [
        {
          title: "学员",
          value: "学员-n",
          children: [],
        },
        {
          title: "管理员",
          value: "管理员-n",
          children: [],
        },
      ];
      const arr2: Option[] = [
        {
          title: "学员",
          value: "学员-n",
          children: [],
        },
        {
          title: "管理员",
          value: "管理员-n",
          children: [],
        },
        {
          title: "管理员日志",
          value: "管理员日志-n",
          children: [],
        },
        {
          title: "管理员角色",
          value: "管理员角色-n",
          children: [],
        },
        {
          title: "线上课",
          value: "线上课-n",
          children: [],
        },
        {
          title: "资源分类",
          value: "资源分类-n",
          children: [],
        },
        {
          title: "部门",
          value: "部门-n",
          children: [],
        },
        {
          title: "系统配置",
          value: "系统配置-n",
          children: [],
        },
        {
          title: "其它",
          value: "其它-n",
          children: [],
        },
      ];
      let actions = res.data.perm_action.action;
      let permissions = res.data.perm_action.data;
      for (let i = 0; i < permissions.length; i++) {
        arr.map((item: any) => {
          if (item.title === permissions[i].group_name) {
            item.children.push({
              title: permissions[i].name,
              value: permissions[i].id,
            });
          }
        });
      }
      for (let j = 0; j < actions.length; j++) {
        arr2.map((item: any) => {
          if (item.title === actions[j].group_name) {
            item.children.push({
              title: actions[j].name,
              value: actions[j].id,
            });
          }
        });
      }
      setPermissions(arr);
      setActions(arr2);
    });
  };

  const getDetail = () => {
    adminRole.adminRole(id).then((res: any) => {
      let role = res.data.role;
      form.setFieldsValue({
        name: role.name,
        permission_ids: res.data.perm_data,
        action_ids: res.data.perm_action,
      });
      setInit(false);
    });
  };

  const onFinish = (values: any) => {
    if (loading) {
      return;
    }
    let pids = [];
    let aids = [];
    if (values.permission_ids.length === 0 && values.action_ids.length === 0) {
      message.error("必须选择至少一个权限！");
      return;
    }
    if (values.permission_ids) {
      pids = values.permission_ids;
    }
    if (values.action_ids) {
      aids = values.action_ids;
    }
    setLoading(true);
    const params = aids.concat(pids);
    adminRole
      .updateAdminRole(id, values.name, params)
      .then((res: any) => {
        setLoading(false);
        message.success("保存成功！");
        onCancel();
      })
      .catch((e) => {
        setLoading(false);
      });
  };

  const onFinishFailed = (errorInfo: any) => {
    console.log("Failed:", errorInfo);
  };

  return (
    <>
      {open ? (
        <Drawer
          title="编辑角色权限"
          onClose={onCancel}
          maskClosable={false}
          open={true}
          footer={
            <Space className="j-r-flex">
              <Button onClick={() => onCancel()}>取 消</Button>
              <Button
                loading={loading}
                onClick={() => form.submit()}
                type="primary"
              >
                确 认
              </Button>
            </Space>
          }
          width={634}
        >
          {init && (
            <div className="float-left text-center mt-30">
              <Spin></Spin>
            </div>
          )}
          <div
            className="float-left mt-24"
            style={{ display: init ? "none" : "block" }}
          >
            <Form
              form={form}
              name="adminroles-update"
              labelCol={{ span: 5 }}
              wrapperCol={{ span: 19 }}
              initialValues={{ remember: true }}
              onFinish={onFinish}
              onFinishFailed={onFinishFailed}
              autoComplete="off"
            >
              <Form.Item
                label="角色名"
                name="name"
                rules={[{ required: true, message: "请输入角色名!" }]}
              >
                <Input
                  style={{ width: 424 }}
                  allowClear
                  placeholder="请输入角色名"
                />
              </Form.Item>
              <Form.Item label="操作权限" name="action_ids">
                <TreeSelect
                  style={{ width: 424 }}
                  listHeight={600}
                  treeCheckable={true}
                  placeholder="请选择权限"
                  multiple
                  allowClear
                  treeData={actions}
                />
              </Form.Item>
              <Form.Item label="数据权限" name="permission_ids">
                <TreeSelect
                  style={{ width: 424 }}
                  listHeight={600}
                  treeCheckable={true}
                  placeholder="请选择权限"
                  multiple
                  allowClear
                  treeData={permissions}
                />
              </Form.Item>
            </Form>
          </div>
        </Drawer>
      ) : null}
    </>
  );
};
