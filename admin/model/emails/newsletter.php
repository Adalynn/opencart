<?php
class ModelEmailsNewsLetter extends Model {

	public function addSubscriber($data) {

		$this->db->query("INSERT INTO " . DB_PREFIX . "adalynn_subscribers SET  subscriber_emailid = '" . $this->db->escape($data['subscriber_emailid']) . "', subscriber_status = '" . $this->db->escape($data['subscriber_status']) . "', subscriber_addedon = '" . $this->db->escape($data['subscriber_addedon'])."'");

		$subscriber_id = $this->db->getLastId();
		return $subscriber_id;
	}

	public function editSubscriber($data) {

		$query = $this->db->query("UPDATE " . DB_PREFIX . "adalynn_subscribers SET subscriber_status = '" . $this->db->escape($data['subscriber_status']) . "', subscriber_addedon = '" . $this->db->escape($data['subscriber_addedon'])."' where subscriber_emailid = '" . $this->db->escape($data['subscriber_emailid'])."'");
		
		if ($query) {
			$subscriber = $this->getSubscriber($data);
			return $subscriber['subscriber_id'];
		} else {
			return false;
		}
	}

	public function getSubscriber($data) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "adalynn_subscribers where subscriber_emailid = '" . $this->db->escape($data['subscriber_emailid']) . "'");

		if ($query->num_rows) {
			return array(
				'subscriber_id'       => $query->row['subscriber_id'],
				'subscriber_emailid'             => $query->row['subscriber_emailid'],
				'subscriber_status'      => $query->row['subscriber_status'],
				'subscriber_addedon'       => $query->row['subscriber_addedon'],
			);
		} else {
			return false;
		}
	}	

	public function getTotalEmailSubscriber($subscriber_status = 1) {
		$query = $this->db->query("SELECT COUNT(DISTINCT subscriber_emailid) AS total FROM " . DB_PREFIX . "adalynn_subscribers WHERE subscriber_status = '" . (int)$subscriber_status . "'");
		return $query->row['total'];
	}

	public function getEmailSubscribers($subscriber_status) {

		$query = $this->db->query("SELECT subscriber_id, subscriber_emailid, subscriber_status, subscriber_addedon FROM " . DB_PREFIX . "adalynn_subscribers where subscriber_status = '" . $subscriber_status . "'");

		if ($query->num_rows) {
			return $query->rows;
		} else {
			return false;
		}		
	}

}