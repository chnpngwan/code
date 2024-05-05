import java.util.ArrayList;
import java.util.List;

/**
 * ProjectName:  ssm
 * PackageName:  PACKAGE_NAME
 * ClassName:    TreeNode
 *
 * @Author chnpngwng
 * @Date 2023 06 27 20 03
 **/


public class TreeNode {
    private int id;
    private String name;
    private List<TreeNode> children;

    // 构造函数
    public TreeNode(int id, String name) {
        this.id = id;
        this.name = name;
        this.children = new ArrayList<>();
    }

    // 添加子节点
    public void addChild(TreeNode child) {
        this.children.add(child);
    }

    // 获取子节点列表
    public List<TreeNode> getChildren() {
        return this.children;
    }

    // 递归遍历节点
    public void traverse() {
        System.out.println(this.name);
        for (TreeNode child : this.children) {
            child.traverse();
        }
    }

    // 根据ID查找节点
    public TreeNode find(int id) {
        if (this.id == id) {
            return this;
        }
        for (TreeNode child : this.children) {
            TreeNode node = child.find(id);
            if (node != null) {
                return node;
            }
        }
        return null;
    }
}
