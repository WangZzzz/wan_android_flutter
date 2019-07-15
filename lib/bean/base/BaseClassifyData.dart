/**
 * 分类数据基类
 */
class BaseClassifyData {
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;
  int courseId;

  BaseClassifyData(this.id, this.name, this.order, this.parentChapterId,
      this.userControlSetTop, this.visible, this.courseId);
}
